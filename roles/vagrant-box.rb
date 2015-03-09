# Name of the role should match the name of the file
name "vagrant-box"

# Run list function we mentioned earlier
run_list(
    "recipe[apt]",
    "recipe[apache2]",
    # "recipe[postgresql]",
    # "recipe[postgresql::server_debian]",
    # "recipe[mysql]",
    # "recipe[php]"
)