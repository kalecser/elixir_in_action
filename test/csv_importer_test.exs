defmodule CSVImporterTest do
  use ExUnit.Case

  test "can import single todo entry" do
    todo_entry = CSVImporter.import_entry("2013/12/19,Dentist")
    assert %TodoAppointment{date: {2013,12,19}, title: "Dentist"} == todo_entry
  end

  test "can import multiple todo entries" do
    todo_entries =
      ["2013/12/19,Dentist\n", "2013/12/20,Portal2"]
      |> CSVImporter.import_entries
      |> Enum.map(&(&1))

    assert [
      %TodoAppointment{date: {2013,12,19}, title: "Dentist"},
      %TodoAppointment{date: {2013, 12, 20}, title: "Portal2"}]
      == todo_entries
  end

  test "can import file" do
      todo_entries =
        CSVImporter.import_file("test/todo.csv")
        |> Enum.map(&(&1))

      assert [
        %TodoAppointment{date: {2013, 12, 19}, title: "Dentist"},
        %TodoAppointment{date: {2013, 12, 20}, title: "Shopping"},
        %TodoAppointment{date: {2013, 12, 19}, title: "Movies"}]
        == todo_entries
    end
end
