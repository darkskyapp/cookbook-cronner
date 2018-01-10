# Policyfile.rb - Describe how you want Chef to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name "ds_cronner"

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list "ds_cronner::default"

named_run_list :default, 'ds_cronner::default'
named_run_list :resource, 'ds_cronner_resource_test'

# Specify a custom source for a single cookbook:
cookbook "ds_cronner", path: "."
cookbook 'ds_cronner_resource_test', path: 'test/fixtures/cookbooks/ds_cronner_resource_test'
cookbook 'cron', '>= 3.0.0'

default['cron']['package_name'] = 'cron'
