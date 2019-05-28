# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Test.create(title: "Ruby", level: 1, category_id: 1)
Test.create(title: "PHP", level: 2, category_id: 1)
Test.create(title: "CSS", level: 1, category_id: 2)
Test.create(title: "HTML", level: 3, category_id: 2)

Category.create(title: "backend")
Category.create(title: "frontend")

User.create(name: "Иван")
User.create(name: "Петр")
User.create(name: "Геннадий")

Question.create(body: "Выберите метод доступа, который  только
  просматривает переменную:", test_id: 1)
Question.create(body: "Какой из нижеперичисленных механизмов позволяет
  субклассу наследовать методы из суперкласса:", test_id: 1)
Question.create(body: "Что из этого не является тегом:", test_id: 4)
Question.create(body: "Расшифруйте CSS:", test_id: 3)
Question.create(body: "Как внедрить php-код в html:", test_id: 2)

Answer.create(body: "attr_reader" , question_id: 1, correct: true)
Answer.create(body: "attr_accessor" , question_id: 1, correct: false)
Answer.create(body: "attr_writer" , question_id: 1, correct: false)
Answer.create(body: "инкапсуляция" , question_id: 2, correct: false)
Answer.create(body: "наследование" , question_id: 2, correct: true)
Answer.create(body: "полиморфизм" , question_id: 2, correct: false)
Answer.create(body: "абстракция" , question_id: 2, correct: false)

Answer.create(body: "bgcolor" , question_id: 3, correct: true)
Answer.create(body: "a" , question_id: 3, correct: false)

Answer.create(body: "Технология ООП" , question_id: 4, correct: false)
Answer.create(body: "Каскадные коды стилей" , question_id: 4, correct: false)
Answer.create(body: "Каскадные таблицы стилей" , question_id: 4, correct: true)

Answer.create(body: "<?php ... ?>" , question_id: 5, correct: true)
Answer.create(body: "<?phphtml ... />" , question_id: 5, correct: false)

PassedTest.create(user_id: 1, test_id: 1 , score: 10)
PassedTest.create(user_id: 1, test_id: 2 , score: 8)
PassedTest.create(user_id: 1, test_id: 3 , score: 6)
PassedTest.create(user_id: 1, test_id: 4 , score: 10)
PassedTest.create(user_id: 2, test_id: 2 , score: 8)
PassedTest.create(user_id: 2, test_id: 3 , score: 6)
PassedTest.create(user_id: 2, test_id: 4 , score: 6)
