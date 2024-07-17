const String fontLibre = 'assets/fonts/GemunuLibre-Medium.ttf';
//images
const String footBallHistoryIcon = 'assets/icons/football_history.svg';
const String footBallPlayersIcon = 'assets/icons/football_players.svg';
const String footBallTeamIcon = 'assets/icons/football_team.svg';
const String baseballIcon = 'assets/icons/baseball.svg';
const String basketBallHistoryIcon = 'assets/icons/basketball_history.svg';
const String basketBallPlayersIcon = 'assets/icons/basketball_players.svg';
const String cricketIcon = 'assets/icons/cricket.svg';
const String generalWordsIcon = 'assets/icons/generalwords.svg';
const String hockeyIcon = 'assets/icons/hockey.svg';
const String sportmixIcon = 'assets/icons/sportmix.svg';
//audio
final String audio = 'assets/audio/audio.mp3';
//theme cards
List<Map<String, dynamic>> themes = [
  {
    'name': 'Football history',
    'icon': footBallHistoryIcon,
    'id': 'Football_history',
    'list': [
      "Naismith",
      "NBA",
      "ABA",
      "March Madness",
      "Dream Team",
      "Harlem Globetrotters",
      "Wilt 100",
      "Magic vs Bird",
      "Bulls dynasty",
      "Showtime Lakers",
      "Celtics dynasty",
      "Mikan",
      "3-point line",
      "Shot clock",
      "All-Star Game",
      "MVP",
      "Rookie of the Year",
      "Finals",
      "Hall of Fame",
      "Olympic gold"
    ]
  },
  {
    'name': 'Football players',
    'icon': footBallPlayersIcon,
    'id': 'Football_players',
    'list': [
      "Michael Jordan",
      "LeBron James",
      "Kobe Bryant",
      "Magic Johnson",
      "Larry Bird",
      "Shaquille O'Neal",
      "Tim Duncan",
      "Kevin Durant",
      "Stephen Curry",
      "Wilt Chamberlain",
      "Bill Russell",
      "Kareem Abdul-Jabbar",
      "Hakeem Olajuwon",
      "Charles Barkley",
      "Dirk Nowitzki",
      "Scottie Pippen",
      "Dwyane Wade",
      "Karl Malone",
      "Chris Paul",
      "Giannis Antetokounmpo"
    ]
  },
  {
    'name': 'Football teams',
    'icon': footBallTeamIcon,
    'id': 'Football_teams',
    'list': [
      "Barcelona",
      "Real Madrid",
      "Manchester United",
      "Bayern Munich",
      "Chelsea",
      "Liverpool",
      "Juventus",
      "Paris Saint-Germain",
      "Arsenal",
      "Manchester City",
      "Tottenham Hotspur",
      "AC Milan",
      "Inter Milan",
      "Borussia Dortmund",
      "Atletico Madrid",
      "Napoli",
      "Roma",
      "Ajax",
      "Benfica",
      "Porto"
    ]
  },
  {
    'name': 'Basketball history',
    'icon': basketBallHistoryIcon,
    'id': 'Football_players',
    'list': [
      "Naismith",
      "NBA",
      "ABA",
      "March Madness",
      "Dream Team",
      "Harlem Globetrotters",
      "Wilt 100",
      "Magic vs Bird",
      "Bulls dynasty",
      "Showtime Lakers",
      "Celtics dynasty",
      "Mikan",
      "3-point line",
      "Shot clock",
      "All-Star Game",
      "MVP",
      "Rookie of the Year",
      "Finals",
      "Hall of Fame",
      "Olympic gold"
    ]
  },
  {
    'name': 'Basketball players',
    'icon': basketBallPlayersIcon,
    'id': 'Basketball_players',
    'list': [
      "Michael Jordan",
      "LeBron James",
      "Kobe Bryant",
      "Magic Johnson",
      "Larry Bird",
      "Shaquille O'Neal",
      "Tim Duncan",
      "Kevin Durant",
      "Stephen Curry",
      "Wilt Chamberlain",
      "Bill Russell",
      "Kareem Abdul-Jabbar",
      "Hakeem Olajuwon",
      "Charles Barkley",
      "Dirk Nowitzki",
      "Scottie Pippen",
      "Dwyane Wade",
      "Karl Malone",
      "Chris Paul",
      "Giannis Antetokounmpo"
    ]
  },
  {
    'name': 'Cricket',
    'icon': cricketIcon,
    'id': 'Cricket',
    'list': [
      "Wicket",
      "Batsman",
      "Bowler",
      "All-rounder",
      "Century",
      "Duck",
      "Run-out",
      "Stumping",
      "Over",
      "Boundary",
      "Six",
      "Four",
      "Innings",
      "LBW (Leg Before Wicket)",
      "No-ball",
      "Wide",
      "Spin bowler",
      "Pace bowler",
      "Slip",
      "Gully"
    ]
  },
  {
    'name': 'Hockey',
    'icon': hockeyIcon,
    'id': 'Hockey',
    'list': [
      "Puck",
      "Slapshot",
      "Hat trick",
      "Power play",
      "Penalty kill",
      "Faceoff",
      "Goaltender",
      "Blue line",
      "Offside",
      "Icing",
      "Breakaway",
      "Checking",
      "Wrist shot",
      "Overtime",
      "Shootout",
      "Penalty box",
      "Assist",
      "Backhand",
      "Forecheck",
      "Deke"
    ]
  },
  {
    'name': 'Baseball',
    'icon': baseballIcon,
    'id': 'Baseball',
    'list': [
      "Pitcher",
      "Catcher",
      "Home run",
      "Strikeout",
      "Double play",
      "Stolen base",
      "Grand slam",
      "No-hitter",
      "Batting average",
      "ERA (Earned Run Average)",
      "Outfielder",
      "Infield",
      "Shortstop",
      "Slugger",
      "Curveball",
      "Fastball",
      "Changeup",
      "Bullpen",
      "Home plate",
      "Mound"
    ]
  },
  {
    'name': 'Sport MIX',
    'icon': sportmixIcon,
    'id': 'Sport_MIX',
    'list': [
      "Olympics",
      "Paralympics",
      "World Cup",
      "Super Bowl",
      "Wimbledon",
      "Tour de France",
      "Masters",
      "Formula 1",
      "UFC",
      "Ryder Cup",
      "Grand Slam",
      "Ironman",
      "X Games",
      "Commonwealth Games",
      "Stanley Cup",
      "Heisman Trophy",
      "NCAA",
      "Six Nations",
      "MotoGP",
      "America's Cup"
    ]
  },
  {
    'name': 'General words',
    'icon': generalWordsIcon,
    'id': 'General_words',
    'list': [
      "Athlete",
      "Coach",
      "Referee",
      "Medal",
      "Victory",
      "Defeat",
      "Competition",
      "Training",
      "Team",
      "League",
      "Season",
      "Match",
      "Tournament",
      "Record",
      "Stadium",
      "Spectator",
      "Sportsmanship",
      "Fitness",
      "Injury",
      "Goal"
    ]
  },
];
//round time
List<String> timeRound = ['30', '60', '120'];
//round score
List<String> scoreRound = ['30', '50', '100'];
