defmodule EzParams do
  @spec __using__(keyword()) :: Macro.t()
  defmacro __using__(opts) do
    quote bind_quoted: [opts: opts] do
      import Kernel, except: [def: 2]
      import EzParams

      EzParams.__setup__(__MODULE__)
    end
  end

  @doc false
  defmacro def(expr, body) do
    quote do
      Kernel.def(unquote(expr), unquote(body))
      Module.delete_attribute(__MODULE__, :__params__)
    end
  end

  defmacro param(name, type, options \\ []) do
    type = parse_type(type)

    quote bind_quoted: [name: name, type: type, options: options] do
      parameter = %{name: name, options: options, type: type}
      Module.put_attribute(__MODULE__, :__params__, parameter)
    end
  end

  @spec __setup__(module()) :: :ok
  def __setup__(module) do
    Module.register_attribute(module, :__params__, accumulate: true)
    :ok
  end

  defp parse_type({:|, _meta, options}) do
    options
  end

  defp parse_type(type), do: type
end
