desc "Deploy"
task :deploy do

  # build folder
  system "rm -rf build"
  system "mkdir build"

  # git
  Dir.chdir("build") do
    system "git init ."
    system "git remote add origin git@github.com:dnajd/beesbot.com.git"
    system "git checkout --orphan gh-pages"
  end

  # do build
  system "bundle exec middleman build"

  # push build
  Dir.chdir("build") do
    system "git add -A"
    system "git commit -m build"
    system "git push -uf origin gh-pages"
  end
end
