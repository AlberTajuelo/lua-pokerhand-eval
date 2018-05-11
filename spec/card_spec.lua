describe('card.lua class', function()
  describe('should modelize poker cards', function()

    local card = require "holdem.card"

    it('should create a card and give values', function()

      aceSpades = card.Card(14, 1)
      assert(aceSpades:tostring() == "AS")

      aceSpades = card.Card("AS")
      assert(aceSpades:tostring() == "AS")

      aceSpades = card.Card("as")
      assert(aceSpades:tostring() == "AS")

    end)

    it('should give error when create a invalid card', function()

      -- invalid suit
      local status, _ = pcall(function() card.Card(1, 0) end)
      assert(not status, "It should throw an error message")

      local status, _ = pcall(function() card.Card(1, 5) end)
      assert(not status, "It should throw an error message")

      -- invalid rank
      local status, _ = pcall(function() card.Card(0, 1) end)
      assert(not status, "It should throw an error message")

      local status, _ = pcall(function() card.Card(15, 1) end)
      assert(not status, "It should throw an error message")

      -- empty string
      local status, _ = pcall(function() card.Card("") end)
      assert(not status, "It should throw an error message")

      -- nil value
      local status, _ = pcall(function() card.Card() end)
      assert(not status, "It should throw an error message")

      -- number value
      local status, _ = pcall(function() card.Card(5) end)
      assert(not status, "It should throw an error message")

      -- invalid string val
      local status, _ = pcall(function() card.Card("AZ") end)
      assert(not status, "It should throw an error message")

    end)
  end)
end)
