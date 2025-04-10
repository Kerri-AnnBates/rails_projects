require 'active_support/all'
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Account.destroy_all
Comment.destroy_all

# Users
user_1 = Account.create({  id: 1, username: 'juliusomo', image: './images/avatars/image-juliusomo.png' })
user_2 = Account.create({ id: 2, username: 'amyrobson', image: './images/avatars/image-amyrobson.png' })
user_3 = Account.create({ id: 3, username: 'maxblagun', image: './images/avatars/image-maxblagun.png' })
user_4 = Account.create({ id: 4, username: 'ramsesmiron', image: './images/avatars/image-ramsesmiron.png' })

# Comments
comment_1 = Comment.create({
                            content: "Impressive! Though it seems the drag feature could be improved. But overall it looks incredible. You've nailed the design and the responsiveness at various breakpoints works really well.",
                            created_at: 30.days.ago,
                            score: 12,
                            account: user_2
                          })

comment_2 = Comment.create({
                            content: "Woah, your project looks awesome! How long have you been coding for? I'm still new, but think I want to dive into React as well soon. Perhaps you can give me an insight on where I can learn React? Thanks!",
                            created_at: 2.weeks.ago,
                            score: 5,
                            account: user_3
                          })

# Replies
Comment.create({
                content: "If you're still new, I'd recommend focusing on the fundamentals of HTML, CSS, and JS before considering React. It's very tempting to jump ahead but lay a solid foundation first.",
                created_at: 1.weeks.ago,
                score: 4,
                account: user_4,
                parent: comment_2,
                comment_type: 1
              })

Comment.create({
                content: "I couldn't agree more with this. Everything moves so fast and it always seems like everyone knows the newest library/framework. But the fundamentals are what stay constant.",
                created_at: 2.days.ago,
                score: 2,
                account: user_1,
                parent: comment_2,
                comment_type: 1
              })