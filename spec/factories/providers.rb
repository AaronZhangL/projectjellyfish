# == Schema Information
#
# Table name: providers
#
#  id                     :integer          not null, primary key
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  deleted_at             :datetime
#  type                   :string           not null
#  registered_provider_id :integer          not null
#  name                   :string           not null
#  description            :text
#  active                 :boolean
#  cached_tag_list        :string
#
# Indexes
#
#  index_providers_on_registered_provider_id  (registered_provider_id)
#  index_providers_on_type                    (type)
#

FactoryGirl.define do
  factory :provider do
    
  end

end
