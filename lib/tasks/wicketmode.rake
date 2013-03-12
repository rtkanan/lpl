namespace :wicketmode do
  desc "Adding modes to the wicketmode Table"
  task :add_mode => :environment do
    Wicketmode.create( [{mode: 'Bowled'},
                        {mode: 'Catch'},
                        {mode: 'Run Out'},
                        {mode: 'Hit Out'},
                        {mode: 'Hit Wicket'},
                        {mode: 'Not Out'},
                        {mode: 'Retired Hurt'}
                       ] )
  end
end