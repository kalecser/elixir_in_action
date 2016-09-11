defmodule TodoList do
    defstruct auto_id: 1, entries: HashDict.new

    def new do
      %TodoList{}
    end

    def add_appointment(todo_list, appointment) do
      updated_entries = HashDict.put_new(todo_list.entries, todo_list.auto_id, appointment)
      %TodoList{auto_id: todo_list.auto_id + 1, entries: updated_entries}
    end

    def get_appointment(todo_list, id) do
      HashDict.get(todo_list.entries, id)
    end

end