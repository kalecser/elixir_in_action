defmodule CSVImporter do

  def import_file(file) do
    File.stream!(file)
    |> import_entries
  end

  defp import_entries(lines) do
    lines
    |> Stream.map(&import_entry/1)
  end

  defp import_entry(line) do
    String.split(line, ",") |>
    create_appointment
  end

  defp create_appointment([date, title]) do
    date =
      String.split(date, "/")
      |> Enum.map(&parse_date_int/1)
      |> List.to_tuple
    %TodoAppointment{date: date, title: String.trim(title)}
  end

  defp parse_date_int(str) do
    Integer.parse(str)
    |> elem(0)
  end
end