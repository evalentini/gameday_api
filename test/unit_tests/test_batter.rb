$: << File.expand_path(File.dirname(__FILE__) + "/../../lib")

require 'test/unit'
require 'batter'

class TestBatter < Test::Unit::TestCase
  
  
  def test_load_from_id
    batter = Batter.new
    batter.load_from_id('2009_09_20_detmlb_minmlb_1','136722')
    assert batter.team_abbrev == 'det'
    assert batter.first_name == 'Carlos'
    assert batter.last_name == 'Guillen'
    assert batter.season_stats.avg == '.238'
    assert batter.career_stats.avg == '.287'
    assert batter.month_stats.avg == '.171'
  end
  
  
  def test_get_all_ids_for_game
    batters = Batter.get_all_ids_for_game('2009_09_20_detmlb_minmlb_1')
    assert_not_nil batters
    assert batters.length == 87
    assert batters[0] == "111851"
    assert batters[1] == "118158"
    assert batters[85] == "545363"
    assert batters[86] == "547820"
  end
  
  
  def test_get_all_ids_for_game_non_existing_page
    batters = Batter.get_all_ids_for_game('2010_04_05_nyamlb_bosmlb_1')
    assert batters.length == 0
  end

end