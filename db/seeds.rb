# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# ruby encoding: utf-8
ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  next if table == 'schema_migrations' or table == 'roles'

  # MySQL and PostgreSQL
  #ActiveRecord::Base.connection.execute("TRUNCATE #{table}")

  # SQLite
  ActiveRecord::Base.connection.execute("DELETE FROM #{table}")
  ActiveRecord::Base.connection.execute("delete from sqlite_sequence where name = '#{table}'")
end


magazine_list = [
  [ "Ieva", 52, 58200, 22476, 20900,'ieva.jpg',"Y" ],
  [ "Astes", 6, 10000, 3338, 35000,'astes.jpg', 'Y' ],
  [ "Mazais", 12, 11350, 4204, 35000, "mazais.jpg", 'Y'  ],
  [ "Klubs", 12 , 15400, 4580, 38000,"klubs.jpg", 'Y' ],
  [ "Santa", 13, 17200, 5154, 60000, "santa.jpg", 'Y' ]
]

magazine_list.each do |title, issue, prints, subscribers, readership, picture, status|
  Magazine.create!( title: title, issue: issue, prints: prints, subscribers: subscribers, readership: readership, picture: picture, status: status )
end


issue_list = [
  [ 1, 2 ,"2014-05-01" ,"2014-07-01" ,'Y'],
  [ 1, 1 , "2014-06-04","2014-07-01" ,'Y'],
  [ 1, 3 , "2014-07-05","2014-08-01" ,'Y'],
  [ 3, 1 , "2014-05-01","2014-07-01" ,'Y'],
  [ 3, 2 , "2014-06-02","2014-07-01" ,'Y'],
  [ 4, 1 , "2014-02-01", "2014-07-01",'Y'],
  [ 5, 2 ,"2014-01-04" ,"2014-07-01" ,'Y'],
  [ 5, 3 ,"2014-02-06" , "2014-07-01",'Y'],
  [ 5, 5 , "2014-03-08","2014-07-01" ,'Y'],
  [ 5, 6 , "2014-04-09","2014-07-01" ,'Y'],
  [ 5, 1 , "2014-05-01", "2014-06-01" ,'Y']
]

issue_list.each do |magazine_id, number, date, due_date, status|
  Issue.create!( magazine_id: magazine_id, number: number, date: date, due_date: due_date, status: status )
end

field_list = [
  	[ '1/1' ,  1, 297 , 220 , 1510 ,'Y'],
  	[ '2/1',  1, 297 , 440 , 1950 ,'Y'],
  	['2/3 HORIZ', 1 , 190 , 210 , 1010 ,'Y'],
  	['2/3 VERT', 1 , 297 , 138 , 1010 ,'Y'],
  	['1/2 HORIZ', 1 , 142 , 210 , 830 ,'Y'],
  	['1/2 VERT', 1 , 103 , 287 , 830 ,'Y'],
  	['1/3 HORIZ', 1 , 94 , 210 , 560 ,'Y'],
  	['1/3 VERT', 1 , 68 , 287 , 560 ,'Y'],
  	['1/3 KV', 1 , 142 , 138 , 560 ,'Y'],
  	['1/4', 1 , 142 , 103 , 450 ,'Y'],
  	[ '1/1' , 2 ,297 , 220 , 1510 ,'Y'],
  	[ '2/1',  2, 297 , 440 , 1950 ,'Y'],
  	['2/3 HORIZ', 2 , 190 , 210 , 1010 ,'Y'],
  	['2/3 VERT', 2 , 297 , 138 , 1010 ,'Y'],
  	['1/2 HORIZ', 2 , 142 , 210 , 830 ,'Y'],
  	['1/2 VERT', 2 , 103 , 287 , 830 ,'Y'],
  	['1/3 HORIZ', 2 , 94 , 210 , 560 ,'Y'],
  	['1/3 VERT', 3 , 68 , 287 , 560 ,'Y'],
  	['1/3 KV', 3 , 142 , 138 , 560 ,'Y'],
  	['1/4', 3 , 142 , 103 , 450 ,'Y'],
  	[ '1/1' , 4 ,297 , 220 , 1510 ,'Y'],
  	[ '2/1',  4, 297 , 440 , 1950 ,'Y'],
  	['2/3 HORIZ', 4 , 190 , 210 , 1010 ,'Y'],
  	['2/3 VERT', 4 , 297 , 138 , 1010 ,'Y'],
  	['1/2 HORIZ', 4 , 142 , 210 , 830 ,'Y'],
  	['1/2 VERT', 5 , 103 , 287 , 830 ,'Y'],
  	['1/3 HORIZ', 5 , 94 , 210 , 560 ,'Y'],
  	['1/3 VERT', 5 , 68 , 287 , 560 ,'Y'],
  	['1/3 KV', 5 , 142 , 138 , 560 ,'Y'],
  	['1/4', 5 , 142 , 103 , 450 ,'Y']
]

field_list.each do |title, magazine_id, height, width, price, status|
  Field.create!( title: title, magazine_id: magazine_id, height: height, width: width, price: price, status: status )
end

agency_list = [
  [ 'Active Promo', 41503054542 , 'Bieķensalas 6, Rīga, LV-1004' , 67470929 ,'Y'],
  	['BSMS', 40003007246 , 'Stabu 10 k.3, Rīga, LV-1010' , 67326314 ,'Y'],
  	['Add Point', 90000270634 , 'Ģertrūdes 59-7, Rīga, LV-1011' , 20333302 ,'Y'],
  	['AdGuru', 40003361404 , 'Rīgas 66, Daugavpils, LV-5401' , 29433637 ,'Y'],
  	['Idea House', 90000050138 , 'Čiekurkalna 1.līnija 47-5.st., Rīga, LV-1026' , 67310534  ,'Y']
]

agency_list.each do |title, reg_number, address, phone, status|
  Agency.create!( title: title, reg_number: reg_number, address: address, phone: phone, status: status )
end

client_list = [
  ['Skrīveru saldumi', 45403016339 , 67327422 , 'Ausma', 'Sabie@driba.ar', 'Y'],
  ['A/S SMILTENES PIENS', 43903002031 , 64707600  , 'Gita Mūrniece', 'gita.murniece@smiltenespiens.lv', 'Y'],
  ['Latvijas Universitāte ', 3341000218 , 67034444 , 'Juris Borzovs', 'juris.borzovs@lu.lv', 'Y'],
  ['Draugiem', 40003737497 , 67271411 , 'Lilita Pētersone', 'draugiem@draugiem.lv', 'Y'],
  ['LAIMA', 40003020441 , 67080302 , 'Ausma Kantāte', 'pamat@kapita.ls', 'Y']
]

client_list.each do |title, reg_number, phone, contact, email, status|
  Client.create!( title: title, reg_number: reg_number, phone: phone, contact: contact, email: email, status: status )
end

user_list = [
  ['churljix', 'qwerty1', 'Jana', 'Smelēna', 'dzeina13@inbox.lv', 26999439 , 1 ,'Y'],
  ['saulite', 'qwerty1', 'Ausma', 'Niedrīte', 'saule@meness.lv', 22345676 , 2 ,'Y'],
  ['alekssgu', 'alekss0', 'Aleksandrs', 'Gusevs', 'gusevs.aleksands@gmail.com', 29826904 , 3 ,'Y'],
  ['cola', 'qwerty1', 'Zane', 'Balode', 'puke@gmail.com', 29485738 , 4 ,'Y'],
  ['fans', 'qwerty1', 'Liene', 'Zelmene', 'kakis@zakis.ee', 28574839 , 5 ,'Y'],
]

user_list.each do |username, password, name, last_name, email, phone, agency_id, status|
  User.create!( username: username, password: password, password_confirmation: password, name: name, last_name: last_name, email: email, phone: phone, agency_id: agency_id, status: status )
end


userrole_list = [
  [1, 4],
  [2, 1],
  [3, 1],
  [4, 1],
  [5, 4]
]

userrole_list.each do |user_id, role_id|
  UserRole.create!( user_id: user_id, role_id: role_id )
end

message_list = [
  [ 1 , 2 , 'I mean 100+ MB big; such text files can push the envelope of editors.', true, 'S'],
  [  1, 3 , ' need to look through a large XML file, but cannot if the editor is buggy', true, 'S'],
  [ 1 , 4 , 'n Windows will open GIANT (think 5GB) files ', true, 'S'],
  [ 2 , 4 , 'an 2012 (thanks for the tip, ChristophK): there is a ', true, 'S'],
  [ 3 , 4 , 'cygwin, just use less ("less is more", onl', true, 'S'],
  [ 4 , 1 , 'Community Wiki Suggestions:', true, 'S'],
  [ 4 , 2 , 'Finally, 100 MB isnt too big. 3 GB is getting kinda big. I used to work at a print & mail facility that created about 2 % of U.S. first class mail. One of the systems for which I was the tech lead accounted for about 15+ % of the pieces of mail. We had some big files to debug here and there :-)', true, 'S'],
  [ 4 , 2 , 'I''ve found that UltraEdit32 ', true, 'S']
]

message_list.each do |user_id, recipient_id, text, visible, status|
  Message.create!( user_id: user_id, recipient_id: recipient_id, text: text, visible: visible, status: status )
end

contract_list = [
  [ 2 , '2014-06-01', 1 , '', 1 ,'Y'],
  [ 3 , '2014-06-01', 1 , 'Labs darijums', 1 ,'Y'],
  [ 4 , '2014-06-01', 1 , 'Ipašie noteikumi', 1 ,'Y'],
  [ 2 , '2014-06-01', 1 , 'Pedējais līgums', 4 ,'Y'],
  [ 3 , '2014-06-01', 1 , 'Ilgtermiņā', 4 ,'Y'],
  [ 4 , '2014-06-01', 1 , 'Maksimālais labums mums', 4 ,'Y']
]

contract_list.each do |agency_id, date, discount, notes, user_id, status|
  Contract.create!( user_id: user_id, agency_id: agency_id, date: date, discount: discount, notes: notes, status: status )
end

orders_list = [
  [ 1 , 3 , 1 , 2 , 1 , 'Savējie', '', 1010 , 1 , 'P'],
  [ 2 , 4 , 1 , 3 , 2 , 'Saule', '', 1010 , 1 , 'S'],
  [ 4 , 18 , 2 , 4 , 3 , 'Udens', '', 560 , 1 , 'S'],
  [ 8 , 26 , 3 , 2 , 4 , 'Mazs darijums', 'ārā ir ziema tāpēc vajag reklāmu', 560 , 1 , 'A'],
  [ 9 , 27 , 4 , 3 , 5 , 'Labi laiki', '', 560 , 1 , 'S'],
  [ 10 , 28 , 5 , 4 , 6 , '', '', 560 , 1 , 'S']
]

orders_list.each do |issue_id, field_id, client_id, user_id, contract_id, title, notes, total_amount, special, status|
  Order.create!( issue_id: issue_id, field_id: field_id, client_id: client_id, user_id: user_id ,contract_id: contract_id, title: title, notes: notes, total_amount: total_amount, special: special, status: status )
end

invoice_list = [
  [ 1000 , 1000 , '2014-05-20', '2014-05-30', 2 , 'Var pa daļām', 'S'],
  [ 400 , 200 , '2014-05-20', '2014-05-30', 3 , '', 'P'],
  [ 1010 , 0 , '2014-05-20', '2014-06-30', 1 , '', 'A'],
  [ 560 , 0 , '2014-05-20', '2014-07-30', 4 , 'Var lēnu', 'A'],
  [ 160 , 160 , '2014-05-20', '2014-08-30', 3 , '', 'S'],
  [ 100 , 100 , '2014-05-20', '2014-09-30', 5 , '', 'S']
]

invoice_list.each do |total, remaining, date, due_date, contract_id, note, status|
  Invoice.create!( total: total, remaining: remaining, date: date, due_date: due_date, contract_id: contract_id, note: note, status: status )
end

payment_list = [
  [ 2 , 200 , '2014-05-29', 'Y'],
  [ 3 , 1000 , '2014-05-30', 'Y'],
  [ 3 , 10 , '2014-05-31', 'Y'],
  [ 4 , 100 , '2014-06-01', 'Y'],
  [ 4 , 100 , '2014-06-03', 'Y'],
  [ 4 , 200 , '2014-06-04', 'Y'],
  [ 4 , 160 , '2014-06-05', 'Y']
]

payment_list.each do |invoice_id, amount, date, status|
  Payment.create!( invoice_id: invoice_id, amount: amount, date: date, status: status )
end
