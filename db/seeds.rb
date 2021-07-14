Friendship.destroy_all
Party.destroy_all
User.destroy_all
Viewer.destroy_all


user1 = User.create!(user_name: "Vicki Vallencourt", email: 'highqualityh2o@ex.com', password: 'pickles')
user2 = User.create!(user_name: 'Bob Barker', email: 'spinthat.wheel@example.com', password: 'sploot')
user3 = User.create!(user_name: 'Chris P Bacon', email: 'baconator@example.com', password: 'password123')
user4 = User.create!(user_name: 'Anita Nappe', email: 'sleepy1@example.com', password: '123password')
user5 = User.create!(user_name: 'Chucky McCreepy Doll Face', email: 'keepthekniveshigh@ex.com', password: 'unstable')
