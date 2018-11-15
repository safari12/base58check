defmodule Base58Check do
  def encode(data, version) do
    (version <> data <> checksum(data, version))
    |> Base58.encode
  end

  @spec checksum(binary, binary) :: binary
  defp checksum(data, version) do
    (version <> data)
    |> SCrypto.sha256
    |> SCrypto.sha256
    |> split
  end

  @spec split(binary) :: binary
  defp split(<< hash :: bytes-size(4), _ :: bits >>), do: hash
end
