class ProvidersController < ApplicationController
  after_action :verify_authorized

  def_param_group :provider do
    param :registered_provider_id, :number, desc: 'Registered Provider ID', action_aware: true, allow_nil: false
    param :name, String, desc: 'Provider Name', action_aware: true, allow_nil: false
    param :description, String, desc: 'Provider Description'
    param :tags, Array, desc: 'List of tags', action_aware: true
    param :answers, Array, desc: 'Provisioning Answers', action_aware: true do
      param :name, String, desc: 'Answer key'
      param :value_type, String, desc: 'How to interpret the :value'
    end
    error code: 422, desc: ParameterValidation::Messages.missing
  end

  api :GET, '/providers', 'Lists all providers'
  param :includes, Array, in: Provider.reflect_on_all_associations.map(&:name).map(&:to_s)
  error code: 422, desc: ParameterValidation::Messages.missing

  def index
    authorize Provider
    respond_with_params providers
  end

  api :GET, '/providers/:id', 'Returns a provider'
  param :id, :number
  param :includes, Array, in: Provider.reflect_on_all_associations.map(&:name).map(&:to_s)
  error code: 404, desc: MissingRecordDetection::Messages.not_found
  error code: 422, desc: ParameterValidation::Messages.missing

  def show
    authorize provider
    respond_with_params provider
  end

  api :POST, '/providers', 'Creates a provider'
  param_group :provider

  def create
    provider = provider_class.new provider_params
    authorize provider
    provider.save!
    respond_with provider
  end

  api :PUT, '/providers/:id', 'Updates provider with :id'
  param_group :provider
  error code: 404, desc: MissingRecordDetection::Messages.not_found

  def update
    authorize provider
    provider.update_attributes provider_params
    respond_with provider
  end

  api :DELETE, '/providers/:id', 'Deletes provider with :id'
  param :id, :number, required: true
  error code: 404, desc: MissingRecordDetection::Messages.not_found

  def destroy
    authorize provider
    provider.destroy
    respond_with provider
  end

  private

  def provider_params
    params.permit(:registered_provider_id, :name, :description, :tags).tap do |pr|
      pr[:tag_list] = pr.delete :tags
      pr[:answers_attributes] = pr.delete :answers
    end
  end

  def provider_class
    @_provider_class ||= RegisteredProvider.find(params[:registered_provider_id]).provider_class.constantize
  end

  def providers
    @_providers ||= query_with Provider.all, :includes, :pagination
  end

  def provider
    @_provider ||= Provider.find params[:id]
  end
end
