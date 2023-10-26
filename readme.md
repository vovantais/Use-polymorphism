## Проблема
У вас есть условный оператор, который, в зависимости от типа или свойств объекта, выполняет различные действия.

## Решение
Создайте подклассы, которым соответствуют ветки условного оператора. В них создайте общий метод и переместите в него код из соответствующей ветки условного оператора. Впоследствии замените условный оператор на вызов этого метода. Таким образом, нужная реализация будет выбираться через полиморфизм в зависимости от класса объекта.

## Достоинства

- Этот рефакторинг реализует принцип говори, а не спрашивай: вместо того, чтобы спрашивать объект о его состоянии, а потом выполнять на основании этого какие-то действия, гораздо проще просто сказать ему, что нужно делать, а как это делать он решит сам.

- Убивает дублирование кода. Вы избавляетесь от множества почти одинаковых условных операторов.

- Если вам потребуется добавить новый вариант выполнения, все, что придётся сделать, это добавить новый подкласс, не трогая существующий код (принцип открытости/закрытости).

# Ресурсы
- 👀 [Refactoring](https://refactoring.guru/ru/replace-conditional-with-polymorphism)