defmodule Base58CheckTest do
  use ExUnit.Case
  doctest Base58Check

  describe "encode" do
    test "version being 00 and with a hello string" do
      assert Base58Check.encode("hello", <<0x00>>) == "12L5B5yqsf7vwb"
    end
    test "version being 00 and with hex binary" do
      assert Base58Check.encode(
        <<0x01, 0x09, 0x66, 0x77, 0x60,
          0x06, 0x95, 0x3D, 0x55, 0x67,
          0x43, 0x9E, 0x5E, 0x39, 0xF8,
          0x6A, 0x0D, 0x27, 0x3B, 0xEE>>,
        <<0x00>>
      ) == "16UwLL9Risc3QfPqBUvKofHmBQ7wMtjvM"
    end
  end
end
