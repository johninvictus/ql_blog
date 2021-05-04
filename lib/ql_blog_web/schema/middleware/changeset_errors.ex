defmodule QlBlogWeb.Schema.Middleware.ChangesetErrors do
  @moduledoc "Convert error message to data error"

  @behaviour Absinthe.Middleware

  def call(res, _), do: parse_error(res)

  @doc false
  defp parse_error(%{errors: [%Ecto.Changeset{} = changeset]} = res),
    do: %{res | value: %{errors: transform_errors(changeset)}, errors: []}

  @doc false
  defp parse_error(%{errors: [%{} = errors]} = res) do
    errors =
      errors
      |> Enum.map(fn {key, value} -> %{key: key, message: value} end)

    %{res | value: %{errors: errors}, errors: []}
  end

  defp parse_error(res), do: res

  defp transform_errors(changeset) do
    changeset
    |> Ecto.Changeset.traverse_errors(&format_error/1)
    |> Enum.map(fn
      {key, value} ->
        %{key: key, message: value}
    end)
  end

  defp format_error({msg, opts}) do
    Enum.reduce(opts, msg, fn {key, value}, acc ->
      String.replace(acc, "%{#{key}}", to_string(value))
    end)
  end
end
