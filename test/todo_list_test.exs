defmodule TodoListTest do
  use ExUnit.Case
    test "can add appointment to TodoList" do
        appointment = %TodoAppointment{date: {2013, 12, 19}, title: "Dentist"}

        subject =
          TodoList.new
          |> TodoList.add_appointment(appointment)

        actual = TodoList.get_appointment(subject, 1)
        assert appointment == actual
    end

    test "can add multiple appointments to TodoList" do

        appointment1 = %TodoAppointment{date: {2013, 12, 19}, title: "Dentist"}
        appointment2 = %TodoAppointment{date: {2013, 12, 20}, title: "Meeting"}

        subject =
          TodoList.new |>
          TodoList.add_appointment(appointment1) |>
          TodoList.add_appointment(appointment2)

        assert appointment1 == TodoList.get_appointment(subject, 1)
        assert appointment2 == TodoList.get_appointment(subject, 2)
    end
end