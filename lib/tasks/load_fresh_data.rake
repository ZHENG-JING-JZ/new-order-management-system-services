# This is to flush the db and load data from /db/data.json
namespace :warehouse do
  task :load_data do
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:seed'].invoke
  end
end