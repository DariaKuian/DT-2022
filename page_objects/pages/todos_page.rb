class TodosPage < SitePrism::Page
  section :todos, Todo, 'ul.todos-list li'
end
