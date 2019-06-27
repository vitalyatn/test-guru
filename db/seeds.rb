# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([
  { title: "backend" },
  { title: "frontend" }
])

users = User.create!([
  { first_name: "Иван", email: "ivan@example.com", password: "123456" },
  { first_name: "Петр", email: "petr@example.com", password: "123456" },
  { first_name: "Вася", email: "vasya@example.com", password: "123456" }
  ])

tests = Test.create!([
    { title: "Ruby", level: 1, category: categories[0], author: users[2] },
    { title: "PHP", level: 2,  category: categories[0], author: users[2] },
    { title: "CSS", level: 1, category: categories[1], author: users[2] },
    { title: "HTML", level: 3,  category: categories[1], author: users[2] }
  ])

questions = Question.create!([
  { body: "Выберите метод доступа, который
    только просматривает переменную:", test: tests[0] },
  { body: "Какой из нижеперичисленных механизмов позволяет
    субклассу наследовать методы из суперкласса:", test: tests[0] },
  { body: "Что из этого не является тегом:", test: tests[3] },
  { body: "Расшифруйте CSS:", test: tests[2] },
  { body: "Как внедрить php-код в html:", test: tests[2] }
  ])

answers = Answer.create!([
  { body: "attr_reader", question: questions[0], correct: true },
  { body: "attr_writer", question: questions[0], correct: false },
  { body: "attr_accessor", question: questions[0], correct: false },
  { body: "инкапсуляция", question: questions[1], correct: false },
  { body: "наследование", question: questions[1], correct: true },
  { body: "полиморфизм", question: questions[1], correct: false },
  { body: "абстракция", question: questions[1], correct: false },
  { body: "bgcolor", question: questions[2], correct: true },
  { body: "a", question: questions[2], correct: false },
  { body: "Технология ООП", question: questions[3], correct: false },
  { body: "Каскадные коды стилей", question: questions[3], correct: true },
  { body: "Каскадные таблицы стилей", question: questions[3], correct: false },
  { body: "<?php ... ?>", question: questions[4], correct: true },
  { body: "<?phphtml ... />", question: questions[4], correct: false }
  ])

passedtests = PassedTest.create!([
  { user: users[0], test: tests[0] , score: 10 },
  { user: users[0], test: tests[1] , score: 8 },
  { user: users[0], test: tests[2] , score: 6 },
  { user: users[0], test: tests[3] , score: 10 },
  { user: users[1], test: tests[1] , score: 1 },
  { user: users[1], test: tests[2] , score: 3},
  { user: users[1], test: tests[3] , score: 4 }
  ])
