
desc "Deploy"
task :deploy do
  
  # set folders
  deploy_dir = 'deploy'
  public_dir = '_site'

  # cleanup
  puts "## Deploying to Github Pages.."
  (Dir["#{deploy_dir}/*"]).each { |f| rm_rf(f) }

  # copy
  puts "## Copying #{public_dir} to #{deploy_dir}"
  cp_r "#{public_dir}/.", deploy_dir

  # push
  cd "#{deploy_dir}" do
    system "git add ."
    system "git add -u"

    puts "## Commiting: Site updated at #{Time.now.utc}"
    message = "Site updated at #{Time.now.utc}"
    system "git commit -m \"#{message}\""

    puts "## Pushing generated #{deploy_dir} website"
    system "git push origin master --force"

    puts "## Deploy Complete!"
  end
end