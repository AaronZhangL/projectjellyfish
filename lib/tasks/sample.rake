namespace :sample do
  desc 'Reset Auto Increment Ids'
  task reset: :environment do
    Alert.connection.execute('ALTER SEQUENCE alerts_id_seq RESTART 1')
    Order.connection.execute('ALTER SEQUENCE orders_id_seq RESTART 1')
    OrderItem.connection.execute('ALTER SEQUENCE order_items_id_seq RESTART 1')
    Project.connection.execute('ALTER SEQUENCE projects_id_seq RESTART 1')
    Product.connection.execute('ALTER SEQUENCE products_id_seq RESTART 1')
    Staff.connection.execute('ALTER SEQUENCE staff_id_seq RESTART 1')
  end

  desc 'Populate sample data for Jenkins'
  task jenkins: :environment do
    Staff.create!([
      {first_name: "User", last_name: "Staff", email: "user@projectjellyfish.org", phone: nil, encrypted_password: "$2a$10$bynEL3.p88qbPDtUglarDuqhhTliXxkC9azXvZgg6h.NgqfT9pdde", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, role: 0, deleted_at: nil, authentication_token: "$2a$10$0sv1Tg1cTv8LeXizBBdMD.8iJBv1HBtOfypJmGl2OzjKIA.JRM5ge"},
      {first_name: "Unused", last_name: "Staff", email: "unused@projectjellyfish.org", phone: nil, encrypted_password: "$2a$10$RztaZ3OtXO7/VLH1MRU8gua9jHAl1df3JhrDT1tAV3SZRnBxyiEEe", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, role: 0, deleted_at: nil, authentication_token: "$2a$10$7cWESfjrjeOHNlr2Mz3yOeCLZLJhzKYSDwmb1lbGp4x22LJnXYvy6"},
      {first_name: "ManageIQ", last_name: "Staff", email: "miq@projectjellyfish.org", phone: nil, encrypted_password: "$2a$10$Spz4Gcw2v/uUSiMSXfmeRuvMDbc28Q4PjefDl2qZMt2/b6ymySsdi", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 17, current_sign_in_at: "2015-02-06 17:04:10", last_sign_in_at: "2015-02-06 16:57:41", current_sign_in_ip: "54.172.90.47", last_sign_in_ip: "54.172.90.47", role: 1, deleted_at: nil, authentication_token: "$2a$10$mxWpQVgSh7OlnDDf38JW9uD8mPeJV.LTBGsUsFmR0FzNfn4864kby"},
      {first_name: "Admin", last_name: "Staff", email: "admin@projectjellyfish.org", phone: nil, encrypted_password: "$2a$10$v2oQ6LgCVev9B5MkbVvIWuFBR2x7g/bqK0.VrS/ViiFCb99RpZY1u", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 14, current_sign_in_at: "2015-02-10 01:54:51", last_sign_in_at: "2015-02-10 01:30:24", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "72.183.103.55", role: 1, deleted_at: nil, authentication_token: "$2a$10$hcfEvuKKlJiaY.IXO8VMo.3tSFTZH6TybvBwJWJouYjKcNHMwyn5q"}
    ])
    Alert.create!([
      {project_id: 3, staff_id: 0, status: "CRITICAL", message: "$200 of $2,000 budget remaining. Please increase funding or instance will be retired.", start_date: nil, end_date: nil, order_item_id: 6},
      {project_id: 2, staff_id: 0, status: "WARNING", message: "Medium PostgreSQL is approaching capacity. Please increase DB size or add addtional resources to avoid service interruptions.", start_date: nil, end_date: nil, order_item_id: 3}
    ])
    Approval.create!([
      {staff_id: 3, project_id: 1, approved: false},
      {staff_id: 3, project_id: 2, approved: true}
    ])
    Cloud.create!([
      {name: "AWS", description: nil, extra: "{}", deleted_at: nil},
      {name: "Azure", description: nil, extra: "{}", deleted_at: nil},
      {name: "Rackspace", description: nil, extra: "{}", deleted_at: nil},
      {name: "VMware", description: nil, extra: nil, deleted_at: nil},
      {name: "Google", description: nil, extra: nil, deleted_at: nil},
      {name: "Other", description: nil, extra: nil, deleted_at: nil}
    ])
    Product.create!([
      {name: "Small", description: "Small EC2 Instance", service_type_id: 8, service_catalog_id: 1, cloud_id: 1, chef_role: "--CHEF-ROLE--", active: true, img: "products/aws_ec2.png", options: {}, deleted_at: nil, product_type_id: 1, setup_price: "1.99", hourly_price: "0.001", monthly_price: "0.05"},
      {name: "Medium", description: "Medium EC2 Instance", service_type_id: 8, service_catalog_id: 1, cloud_id: 1, chef_role: "--CHEF-ROLE--", active: true, img: "products/aws_ec2.png", options: {}, deleted_at: nil, product_type_id: 1, setup_price: "2.99", hourly_price: "0.0025", monthly_price: "0.075"},
      {name: "Large", description: "Large EC2 Instance", service_type_id: 8, service_catalog_id: 1, cloud_id: 1, chef_role: "--CHEF-ROLE--", active: true, img: "products/aws_ec2.png", options: {}, deleted_at: nil, product_type_id: 1, setup_price: "3.99", hourly_price: "0.0055", monthly_price: "0.12"},
      {name: "Medium MySQL", description: "Medium MySQL", service_type_id: 3, service_catalog_id: 1, cloud_id: 1, chef_role: "--CHEF-ROLE--", active: true, img: "products/aws_rds.png", options: {}, deleted_at: nil, product_type_id: 3, setup_price: "1.99", hourly_price: "0.004", monthly_price: "0.1"},
      {name: "Medium PostgreSQL", description: "Medium PostgreSQL", service_type_id: 3, service_catalog_id: 1, cloud_id: 1, chef_role: "--CHEF-ROLE--", active: true, img: "products/aws_rds.png", options: {}, deleted_at: nil, product_type_id: 3, setup_price: "2.99", hourly_price: "0.004", monthly_price: "0.25"},
      {name: "Large PostgreSQL", description: "Large PostgreSQL", service_type_id: 3, service_catalog_id: 1, cloud_id: 1, chef_role: "--CHEF-ROLE--", active: true, img: "products/aws_rds.png", options: {}, deleted_at: nil, product_type_id: 3, setup_price: "3.99", hourly_price: "0.009", monthly_price: "0.5"},
      {name: "Medium Aurora", description: "Medium Aurora", service_type_id: 3, service_catalog_id: 1, cloud_id: 1, chef_role: "--CHEF-ROLE--", active: true, img: "products/aws_rds.png", options: {}, deleted_at: nil, product_type_id: 3, setup_price: "4.99", hourly_price: "0.015", monthly_price: "0.95"},
      {name: "Large SQL Server", description: "Large SQL Server", service_type_id: 3, service_catalog_id: 1, cloud_id: 1, chef_role: "--CHEF-ROLE--", active: true, img: "products/aws_rds.png", options: {}, deleted_at: nil, product_type_id: 3, setup_price: "5.99", hourly_price: "0.025", monthly_price: "1.29"},
      {name: "West Coast Storage", description: "Normal, Northern California", service_type_id: 5, service_catalog_id: 1, cloud_id: 1, chef_role: "--CHEF-ROLE--", active: true, img: "products/aws_s3.png", options: {}, deleted_at: nil, product_type_id: 4, setup_price: "0.99", hourly_price: "0.001", monthly_price: "0.05"},
      {name: "Small MySQL", description: "Small MySQL", service_type_id: 3, service_catalog_id: 1, cloud_id: 1, chef_role: "--CHEF-ROLE--", active: true, img: "products/aws_rds.png", options: {}, deleted_at: nil, product_type_id: 3, setup_price: "1.0", hourly_price: "1.0", monthly_price: "1.0"},
      {name: "LAMP Stack", description: "Linux, Apache, MySQL, PHP", service_type_id: 0, service_catalog_id: 0, cloud_id: 1, chef_role: "0", active: true, img: "products/php.png", options: nil, deleted_at: nil, product_type_id: 5, setup_price: "10.0", hourly_price: "10.0", monthly_price: "10.0"},
      {name: "LAMP Stack", description: "Linux, Apache, MySQL, PHP", service_type_id: 0, service_catalog_id: 0, cloud_id: 4, chef_role: "0", active: true, img: "products/php.png", options: nil, deleted_at: nil, product_type_id: 5, setup_price: "20.0", hourly_price: "20.0", monthly_price: "20.0"},
      {name: "Rails Stack", description: "Ruby on Rails Stack", service_type_id: 0, service_catalog_id: 0, cloud_id: 1, chef_role: "0", active: true, img: "products/rails.png", options: nil, deleted_at: nil, product_type_id: 5, setup_price: "10.0", hourly_price: "10.0", monthly_price: "10.0"},
      {name: "MEAN Stack", description: "MongoDB, ExpressJS, AngularJS, NodeJS.", service_type_id: 0, service_catalog_id: 0, cloud_id: 4, chef_role: "0", active: true, img: "products/mean.png", options: nil, deleted_at: nil, product_type_id: 5, setup_price: "10.0", hourly_price: "10.0", monthly_price: "10.0"},
      {name: "Sr. Java Developer", description: "", service_type_id: 0, service_catalog_id: 0, cloud_id: 6, chef_role: "0", active: true, img: "products/woman.png", options: nil, deleted_at: nil, product_type_id: 7, setup_price: "10.0", hourly_price: "10.0", monthly_price: "10.0"},
      {name: "Sr. System Administrator", description: "Sr. System Administrator", service_type_id: 0, service_catalog_id: 0, cloud_id: 6, chef_role: "0", active: true, img: "products/woman.png", options: nil, deleted_at: nil, product_type_id: 7, setup_price: "10.0", hourly_price: "10.0", monthly_price: "10.0"},
      {name: "Project Manager", description: "Project Manager", service_type_id: 0, service_catalog_id: 0, cloud_id: 6, chef_role: "0", active: true, img: "products/man.png", options: nil, deleted_at: nil, product_type_id: 7, setup_price: "10.0", hourly_price: "10.0", monthly_price: "10.0"},
      {name: "JIRA Project", description: "A project in corporate JIRA instance.", service_type_id: 0, service_catalog_id: 0, cloud_id: 4, chef_role: "0", active: true, img: "products/jira.png", options: nil, deleted_at: nil, product_type_id: 6, setup_price: "10.0", hourly_price: "10.0", monthly_price: "10.0"},
      {name: "Confluence Project", description: "Confluence Project", service_type_id: 0, service_catalog_id: 0, cloud_id: 6, chef_role: "0", active: true, img: "products/confluence.png", options: nil, deleted_at: nil, product_type_id: 6, setup_price: "10.0", hourly_price: "10.0", monthly_price: "10.0"},
      {name: "Bugzilla Instance", description: "Bugzilla Instance", service_type_id: 0, service_catalog_id: 0, cloud_id: 6, chef_role: "0", active: true, img: "products/bugzilla.png", options: nil, deleted_at: nil, product_type_id: 6, setup_price: "10.0", hourly_price: "10.0", monthly_price: "10.0"},
      {name: "1GB NetApps Storage", description: "NetApps Storage", service_type_id: 0, service_catalog_id: 0, cloud_id: 6, chef_role: "0", active: true, img: "products/netapp.png", options: nil, deleted_at: nil, product_type_id: 4, setup_price: "10.0", hourly_price: "10.0", monthly_price: "10.0"},
      {name: "S3 Storage", description: "", service_type_id: 5, service_catalog_id: 1, cloud_id: 1, chef_role: "--CHEF-ROLE--", active: true, img: "products/aws_s3.png", options: {}, deleted_at: nil, product_type_id: 4, setup_price: "1.0", hourly_price: "1.0", monthly_price: "1.0"},
      {name: "100 Node Hadoop Cluster", description: nil, service_type_id: 0, service_catalog_id: 0, cloud_id: 6, chef_role: "0", active: true, img: "products/hadoop.png", options: nil, deleted_at: nil, product_type_id: 2, setup_price: "10.0", hourly_price: "10.0", monthly_price: "10.0"},
      {name: "Teradata", description: "Teradata", service_type_id: 0, service_catalog_id: 0, cloud_id: 6, chef_role: "0", active: true, img: "products/teradata.png", options: nil, deleted_at: nil, product_type_id: 2, setup_price: "10.0", hourly_price: "10.0", monthly_price: "10.0"},
      {name: "10 Node Hadoop Cluster", description: nil, service_type_id: 0, service_catalog_id: 0, cloud_id: 1, chef_role: "0", active: true, img: "products/hadoop.png", options: nil, deleted_at: nil, product_type_id: 2, setup_price: "10.0", hourly_price: "10.0", monthly_price: "10.0"}
    ])
    ProductAnswer.create!([
      {product_id: 1, product_type_question_id: 1, answer: "t2.micro"},
      {product_id: 1, product_type_question_id: 2, answer: "20"},
      {product_id: 2, product_type_question_id: 1, answer: "m3.medium"},
      {product_id: 2, product_type_question_id: 2, answer: "40"},
      {product_id: 3, product_type_question_id: 1, answer: "m3.large"},
      {product_id: 3, product_type_question_id: 2, answer: "80"},
      {product_id: 4, product_type_question_id: 6, answer: "db.m3.medium"},
      {product_id: 4, product_type_question_id: 7, answer: "mysql"},
      {product_id: 4, product_type_question_id: 8, answer: "20"},
      {product_id: 5, product_type_question_id: 6, answer: "db.m3.medium"},
      {product_id: 5, product_type_question_id: 7, answer: "mysql"},
      {product_id: 5, product_type_question_id: 8, answer: "40"},
      {product_id: 5, product_type_question_id: 9, answer: "magnetic"},
      {product_id: 6, product_type_question_id: 6, answer: "db.m3.medium"},
      {product_id: 6, product_type_question_id: 7, answer: "posgresql"},
      {product_id: 6, product_type_question_id: 8, answer: "40"},
      {product_id: 6, product_type_question_id: 9, answer: "ssd"},
      {product_id: 7, product_type_question_id: 6, answer: "db.m3.large"},
      {product_id: 7, product_type_question_id: 7, answer: "postgresql"},
      {product_id: 7, product_type_question_id: 8, answer: "120"},
      {product_id: 7, product_type_question_id: 9, answer: "ssd"},
      {product_id: 8, product_type_question_id: 6, answer: "db.m3.medium"},
      {product_id: 8, product_type_question_id: 7, answer: "aurora"},
      {product_id: 8, product_type_question_id: 8, answer: "40"},
      {product_id: 8, product_type_question_id: 9, answer: "magnetic"},
      {product_id: 9, product_type_question_id: 6, answer: "db.m3.xlarge"},
      {product_id: 9, product_type_question_id: 7, answer: "sqlserver"},
      {product_id: 9, product_type_question_id: 8, answer: "120"},
      {product_id: 9, product_type_question_id: 9, answer: "ssd"},
      {product_id: 10, product_type_question_id: 10, answer: "normal"},
      {product_id: 11, product_type_question_id: 10, answer: "normal"},
      {product_id: 11, product_type_question_id: 11, answer: "us-west-1"},
      {product_id: 12, product_type_question_id: 10, answer: "normal"},
      {product_id: 12, product_type_question_id: 11, answer: "us-west-2"},
      {product_id: 13, product_type_question_id: 10, answer: "reduced"},
      {product_id: 13, product_type_question_id: 11, answer: ""},
      {product_id: 14, product_type_question_id: 10, answer: "reduced"},
      {product_id: 14, product_type_question_id: 11, answer: "us-west-1"},
      {product_id: 15, product_type_question_id: 10, answer: "reduced"},
      {product_id: 15, product_type_question_id: 11, answer: "us-west-2"},
      {product_id: 4, product_type_question_id: 9, answer: "standard"},
      {product_id: 26, product_type_question_id: 10, answer: "normal"},
      {product_id: 26, product_type_question_id: 11, answer: "us-west-1"},
      {product_id: 10, product_type_question_id: 11, answer: "us-west-2"},
      {product_id: 27, product_type_question_id: 3, answer: "4"},
      {product_id: 27, product_type_question_id: 4, answer: "40"},
      {product_id: 27, product_type_question_id: 5, answer: "2"},
      {product_id: 28, product_type_question_id: 3, answer: "4"},
      {product_id: 28, product_type_question_id: 4, answer: "40"},
      {product_id: 28, product_type_question_id: 5, answer: "2"},
      {product_id: 29, product_type_question_id: 3, answer: "4"},
      {product_id: 29, product_type_question_id: 4, answer: "40"},
      {product_id: 29, product_type_question_id: 5, answer: "1"}
    ])
    ProductType.create!([
      {name: "Storage", description: "Storage Solutions"},
      {name: "Big Data", description: "Big Data Platforms"},
      {name: "Services", description: "Other services"},
      {name: "Platforms", description: "Development Platforms"},
      {name: "Staff", description: "Staff for projects"},
      {name: "AWS VM", description: "Amazon EC2 VMs"},
      {name: "RDS", description: "Description of the RDS product type"}
    ])
    ProductTypeQuestion.create!([
      {product_type_id: 1, label: "Instance Size", field_type: "select", placeholder: "", help: "", options: [["t2.micro", "t2.micro"], ["m3.medium", "m3.medium"], ["m3.large", "m3.large"]], default: "m3.medium", required: true, load_order: 0, manageiq_key: "instance_size"},
      {product_type_id: 1, label: "Disk Size", field_type: "text", placeholder: "Size in GBs", help: "", options: nil, default: "40", required: true, load_order: 1, manageiq_key: "disk_size"},
      {product_type_id: 2, label: "RAM", field_type: "text", placeholder: "Size in GBs", help: "", options: nil, default: "4", required: true, load_order: 0, manageiq_key: "ram_size"},
      {product_type_id: 2, label: "Disk Size", field_type: "text", placeholder: "Size in GBs", help: "", options: nil, default: "40", required: true, load_order: 1, manageiq_key: "disk_size"},
      {product_type_id: 2, label: "CPU", field_type: "select", placeholder: "", help: "", options: [["1", "1 CPU"], ["2", "2 CPUs"], ["4", "4 CPUs"], ["6", "6 CPUs"], ["8", "8 CPUs"]], default: "1", required: true, load_order: 2, manageiq_key: "cpu_count"},
      {product_type_id: 3, label: "Instance Size", field_type: "select", placeholder: "", help: "", options: [["db.m3.medium", "db.m3.medium"], ["db.m3.large", "db.m3.large"], ["db.m3.xlarge", "db.m3.xlarge"]], default: "db.m3.medium", required: true, load_order: 0, manageiq_key: "instance_size"},
      {product_type_id: 3, label: "DB Engine", field_type: "select", placeholder: "", help: "", options: [["aurora", "Aurora"], ["mysql", "MySQL"], ["postgresql", "PostgreSQL"], ["sqlserver", "SQL Server"]], default: "", required: true, load_order: 1, manageiq_key: "db_engine"},
      {product_type_id: 3, label: "Disk Size", field_type: "text", placeholder: "Size in GBs", help: "", options: nil, default: "40", required: true, load_order: 2, manageiq_key: "disk_size"},
      {product_type_id: 3, label: "Storage Type", field_type: "select", placeholder: "", help: "", options: [["standard", "standard"], ["gp2", "gp2"], ["io1", "io1"]], default: "ssd", required: true, load_order: 3, manageiq_key: "storage_type"},
      {product_type_id: 4, label: "Storage Redundancy", field_type: "select", placeholder: "", help: "", options: [["normal", "Normal"], ["reduced", "Reduced"]], default: "normal", required: true, load_order: 0, manageiq_key: "availability"},
      {product_type_id: 4, label: "Region", field_type: "select", placeholder: "", help: "", options: [["", "US Standard"], ["us-west-1", "US-West (Northern California)"], ["us-west-2", "US-West (Oregon)"], ["EU", "EU (Ireland)"], ["ap-northeast-1", "Asia Pacific (Tokyo)"], ["ap-southeast-1", "Asia Pacific (Singapore)"], ["ap-southeast-2", "Asia Pacific (Sydney)"]], default: "", required: true, load_order: 1, manageiq_key: "region"}
    ])
    Project.create!([
      {name: "Blog", description: "Project description", cc: "--CC--", budget: 2000.0, staff_id: "--STAFF_ID--", start_date: "2015-02-06", end_date: "2015-11-06", approved: true, img: "/images/128x128-wordpress.png", deleted_at: nil, spent: "1800.0", status: 0},
      {name: "Cloud File Share", description: "Project description", cc: "--CC--", budget: 123654.0, staff_id: "--STAFF_ID--", start_date: "2015-02-06", end_date: "2015-11-06", approved: true, img: "/images/cloud-checkmark-128.png", deleted_at: nil, spent: "0.0", status: 0},
      {name: "Project 1", description: "Project description", cc: "--CC--", budget: 123654.0, staff_id: "--STAFF_ID--", start_date: "2015-02-06", end_date: "2015-11-06", approved: false, img: "/images/documentation.png", deleted_at: nil, spent: "0.0", status: 0},
      {name: "Mobile App API", description: "Project description", cc: "--CC--", budget: 3000.0, staff_id: "--STAFF_ID--", start_date: "2015-02-06", end_date: "2015-11-06", approved: true, img: "/images/icon-mobile-orange.png", deleted_at: nil, spent: "2000.0", status: 0}
    ])
    ProjectAnswer.create!([
      {project_id: 3, project_question_id: 7, answer: nil},
      {project_id: 3, project_question_id: 6, answer: nil},
      {project_id: 3, project_question_id: 5, answer: nil},
      {project_id: 3, project_question_id: 4, answer: nil},
      {project_id: 3, project_question_id: 3, answer: nil},
      {project_id: 3, project_question_id: 2, answer: nil},
      {project_id: 3, project_question_id: 1, answer: nil},
      {project_id: 4, project_question_id: 7, answer: nil},
      {project_id: 4, project_question_id: 6, answer: nil},
      {project_id: 4, project_question_id: 5, answer: nil},
      {project_id: 4, project_question_id: 4, answer: nil},
      {project_id: 4, project_question_id: 3, answer: nil},
      {project_id: 4, project_question_id: 2, answer: nil},
      {project_id: 4, project_question_id: 1, answer: nil},
      {project_id: 1, project_question_id: 1, answer: nil},
      {project_id: 1, project_question_id: 2, answer: nil},
      {project_id: 1, project_question_id: 3, answer: nil},
      {project_id: 1, project_question_id: 4, answer: nil},
      {project_id: 1, project_question_id: 5, answer: nil},
      {project_id: 1, project_question_id: 6, answer: nil},
      {project_id: 1, project_question_id: 7, answer: nil},
      {project_id: 2, project_question_id: 1, answer: nil},
      {project_id: 2, project_question_id: 2, answer: nil},
      {project_id: 2, project_question_id: 3, answer: nil},
      {project_id: 2, project_question_id: 4, answer: nil},
      {project_id: 2, project_question_id: 5, answer: nil},
      {project_id: 2, project_question_id: 6, answer: nil},
      {project_id: 2, project_question_id: 7, answer: nil}
    ])
    ProjectQuestion.create!([
      {question: "Project Description", help_text: "", required: true, deleted_at: nil, load_order: nil, options: [], field_type: 2},
      {question: "Project Charge Code", help_text: "", required: true, deleted_at: nil, load_order: nil, options: [], field_type: 2},
      {question: "Maintenance Day", help_text: "", required: true, deleted_at: nil, load_order: nil, options: [], field_type: 3},
      {question: "Performed Maintenance", help_text: "", required: true, deleted_at: nil, load_order: nil, options: [], field_type: 0},
      {question: "Default provisioning location", help_text: "", required: true, deleted_at: nil, load_order: nil, options: ["East Coast Data Center", "West Coast Data Center", "Classified Data Center"], field_type: 1},
      {question: "Will this run in production?", help_text: "", required: true, deleted_at: nil, load_order: nil, options: ["Yes", "No"], field_type: 1},
      {question: "FISMA Classification", help_text: "", required: true, deleted_at: nil, load_order: nil, options: ["Low", "Medium", "High"], field_type: 1}
    ])
    Setting.create!([
      {name: "AWS"},
      {name: "Manage IQ"},
      {name: "Chef"},
      {name: "JIRA"},
      {name: "Confluence"},
      {name: "Jenkins"},
      {name: "Email"},
      {name: "LDAP"},
      {name: "VMware"},
      {name: "Footer Links"},
      {name: "Header Links"}
    ])
    SettingField.create!([
      {label: "Enable", field_type: 0, help_text: "", options: nil, value: "false", required: nil, load_order: 0, setting_id: 3},
      {label: "API URL", field_type: 2, help_text: "http://example.com", options: nil, value: "", required: nil, load_order: 1, setting_id: 3},
      {label: "Username", field_type: 2, help_text: "user1", options: nil, value: "", required: nil, load_order: 2, setting_id: 3},
      {label: "Password", field_type: 2, help_text: "pass123", options: nil, value: "", required: nil, load_order: 3, setting_id: 3},
      {label: "Enable", field_type: 0, help_text: "", options: nil, value: "false", required: nil, load_order: 0, setting_id: 4},
      {label: "API URL", field_type: 2, help_text: "http://example.com", options: nil, value: "", required: nil, load_order: 1, setting_id: 4},
      {label: "Username", field_type: 2, help_text: "user1", options: nil, value: "", required: nil, load_order: 2, setting_id: 4},
      {label: "Password", field_type: 2, help_text: "pass123", options: nil, value: "", required: nil, load_order: 3, setting_id: 4},
      {label: "Enable", field_type: 0, help_text: "", options: nil, value: "false", required: nil, load_order: 0, setting_id: 5},
      {label: "API URL", field_type: 2, help_text: "http://example.com", options: nil, value: "", required: nil, load_order: 1, setting_id: 5},
      {label: "Username", field_type: 2, help_text: "user1", options: nil, value: "", required: nil, load_order: 2, setting_id: 5},
      {label: "Password", field_type: 2, help_text: "pass123", options: nil, value: "", required: nil, load_order: 3, setting_id: 5},
      {label: "Enable", field_type: 0, help_text: "", options: nil, value: "false", required: nil, load_order: 0, setting_id: 6},
      {label: "API URL", field_type: 2, help_text: "http://example.com", options: nil, value: "", required: nil, load_order: 1, setting_id: 6},
      {label: "API Key", field_type: 2, help_text: "TOKEN", options: nil, value: "", required: nil, load_order: 2, setting_id: 6},
      {label: "Username", field_type: 2, help_text: "user1", options: nil, value: "", required: nil, load_order: 3, setting_id: 6},
      {label: "Password", field_type: 2, help_text: "pass123", options: nil, value: "", required: nil, load_order: 4, setting_id: 6},
      {label: "Enable External Server", field_type: 0, help_text: "", options: nil, value: "false", required: nil, load_order: 0, setting_id: 7},
      {label: "Server", field_type: 2, help_text: "smtp.example.com", options: nil, value: "", required: nil, load_order: 1, setting_id: 7},
      {label: "Username", field_type: 2, help_text: "user1", options: nil, value: "", required: nil, load_order: 2, setting_id: 7},
      {label: "Password", field_type: 2, help_text: "pass123", options: nil, value: "", required: nil, load_order: 3, setting_id: 7},
      {label: "Send As", field_type: 2, help_text: "", options: nil, value: "", required: nil, load_order: 4, setting_id: 7},
      {label: "Port", field_type: 2, help_text: "25", options: nil, value: "", required: nil, load_order: 5, setting_id: 7},
      {label: "Use SSL", field_type: 0, help_text: "", options: nil, value: "false", required: nil, load_order: 6, setting_id: 7},
      {label: "Enable LDAP", field_type: 0, help_text: "", options: nil, value: "false", required: nil, load_order: 0, setting_id: 8},
      {label: "Server", field_type: 2, help_text: "example.com", options: nil, value: "", required: nil, load_order: 1, setting_id: 8},
      {label: "Bind DN", field_type: 2, help_text: "user1", options: nil, value: "", required: nil, load_order: 2, setting_id: 8},
      {label: "Bind Password", field_type: 2, help_text: "pass123", options: nil, value: "", required: nil, load_order: 3, setting_id: 8},
      {label: "Base DN", field_type: 2, help_text: "", options: nil, value: "", required: nil, load_order: 4, setting_id: 8},
      {label: "Enable", field_type: 0, help_text: "", options: nil, value: "false", required: nil, load_order: 0, setting_id: 9},
      {label: "vCenter URL", field_type: 2, help_text: "http://example.com", options: nil, value: "", required: nil, load_order: 1, setting_id: 9},
      {label: "Username", field_type: 2, help_text: "user1", options: nil, value: "", required: nil, load_order: 2, setting_id: 9},
      {label: "Password", field_type: 2, help_text: "pass123", options: nil, value: "", required: nil, load_order: 3, setting_id: 9},
      {label: "Link 1 Label", field_type: 2, help_text: "Example", options: nil, value: "", required: nil, load_order: 0, setting_id: 10},
      {label: "Link 1 URL", field_type: 2, help_text: "http://example.com", options: nil, value: "", required: nil, load_order: 0, setting_id: 10},
      {label: "Link 2 Label", field_type: 2, help_text: "Example", options: nil, value: "", required: nil, load_order: 1, setting_id: 10},
      {label: "Link 2 URL", field_type: 2, help_text: "http://example.com", options: nil, value: "", required: nil, load_order: 1, setting_id: 10},
      {label: "Link 3 Label", field_type: 2, help_text: "Example", options: nil, value: "", required: nil, load_order: 2, setting_id: 10},
      {label: "Link 3 URL", field_type: 2, help_text: "http://example.com", options: nil, value: "", required: nil, load_order: 2, setting_id: 10},
      {label: "Link 4 Label", field_type: 2, help_text: "Example", options: nil, value: "", required: nil, load_order: 3, setting_id: 10},
      {label: "Link 4 URL", field_type: 2, help_text: "http://example.com", options: nil, value: "", required: nil, load_order: 3, setting_id: 10},
      {label: "Link 1 Label", field_type: 2, help_text: "Example", options: nil, value: "", required: nil, load_order: 0, setting_id: 11},
      {label: "Link 1 URL", field_type: 2, help_text: "http://example.com", options: nil, value: "", required: nil, load_order: 0, setting_id: 11},
      {label: "Link 2 Label", field_type: 2, help_text: "Example", options: nil, value: "", required: nil, load_order: 1, setting_id: 11},
      {label: "Link 2 URL", field_type: 2, help_text: "http://example.com", options: nil, value: "", required: nil, load_order: 1, setting_id: 11},
      {label: "Link 3 Label", field_type: 2, help_text: "Example", options: nil, value: "", required: nil, load_order: 2, setting_id: 11},
      {label: "Link 3 URL", field_type: 2, help_text: "http://example.com", options: nil, value: "", required: nil, load_order: 2, setting_id: 11},
      {label: "Link 4 Label", field_type: 2, help_text: "Example", options: nil, value: "", required: nil, load_order: 3, setting_id: 11},
      {label: "Link 4 URL", field_type: 2, help_text: "http://example.com", options: nil, value: "", required: nil, load_order: 3, setting_id: 11},
      {label: "Enabled", field_type: 0, help_text: "Enable AWS services.", options: nil, value: "true", required: nil, load_order: 0, setting_id: 1},
      {label: "Access Key", field_type: 2, help_text: "AWS Access Key", options: nil, value: "AWS_ACCESS_KEY", required: nil, load_order: 1, setting_id: 1},
      {label: "Secret Key", field_type: 2, help_text: "AWS Secret Key", options: nil, value: "AWS_SECRET_KEY", required: nil, load_order: 2, setting_id: 1},
      {label: "URL", field_type: 2, help_text: "http://example.com", options: nil, value: "https://manage-iq.server.com", required: nil, load_order: 0, setting_id: 2},
      {label: "Username", field_type: 2, help_text: "Username", options: nil, value: "admin", required: nil, load_order: 1, setting_id: 2},
      {label: "Password", field_type: 2, help_text: "Password", options: nil, value: "smartvm", required: nil, load_order: 2, setting_id: 2}
    ])
    StaffProject.create!([
      {staff_id: 3, project_id: 1},
      {staff_id: 3, project_id: 2}
    ])
  end
end
