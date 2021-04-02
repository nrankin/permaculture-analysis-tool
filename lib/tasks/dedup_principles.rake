desc "ran seeds twice before the uniq constraint was added? run this dedup"
task :dedup_principles  => :environment do
   puts "Deduplicating Principles..."
   principles = Principle.all
   grouped = principles.group_by{|principle| [principle.name] }
   grouped.values.each do |duplicates|
     # the first one we want to keep right?
    puts "Duplicate found for: #{duplicates[0].name}"
     first_one = duplicates.shift # or pop for last one
     # if there are any more left, they are duplicates
     # so delete all of them
    
     duplicates.each{|double| double.destroy} # duplicates can now be destroyed
     puts "duplicate deleted"
   end
   puts "dedup complete"
end