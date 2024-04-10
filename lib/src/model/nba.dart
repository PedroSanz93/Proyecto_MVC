/*class Game {
  final String get;
  final Parameters parameters;
  final List<dynamic> errors;
  final int results;
  final List<GameDetails> response;

  Game({
    required this.get,
    required this.parameters,
    required this.errors,
    required this.results,
    required this.response,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      get: json['get'],
      parameters: Parameters.fromJson(json['parameters']),
      errors: json['errors'] ?? [],
      results: json['results'],
      response: List<GameDetails>.from(json['response'].map((game) => GameDetails.fromJson(game))),
    );
  }
}

class Parameters {
  final String date;

  Parameters({
    required this.date,
  });

  factory Parameters.fromJson(Map<String, dynamic> json) {
    return Parameters(
      date: json['date'],
    );
  }
}

class GameDetails {
  final int id;
  final String league;
  final int season;
  final Date date;
  final int stage;
  final Status status;
  final Periods periods;
  final Arena arena;
  final Teams teams;
  final Scores scores;
  final List<dynamic> officials;
  final dynamic timesTied;
  final dynamic leadChanges;
  final dynamic nugget;

  GameDetails({
    required this.id,
    required this.league,
    required this.season,
    required this.date,
    required this.stage,
    required this.status,
    required this.periods,
    required this.arena,
    required this.teams,
    required this.scores,
    required this.officials,
    required this.timesTied,
    required this.leadChanges,
    required this.nugget,
  });

  factory GameDetails.fromJson(Map<String, dynamic> json) {
    return GameDetails(
      id: json['id'],
      league: json['league'],
      season: json['season'],
      date: Date.fromJson(json['date']),
      stage: json['stage'],
      status: Status.fromJson(json['status']),
      periods: Periods.fromJson(json['periods']),
      arena: Arena.fromJson(json['arena']),
      teams: Teams.fromJson(json['teams']),
      scores: Scores.fromJson(json['scores']),
      officials: json['officials'] ?? [],
      timesTied: json['timesTied'],
      leadChanges: json['leadChanges'],
      nugget: json['nugget'],
    );
  }
}

class Date {
  final String start;
  final dynamic end;
  final dynamic duration;

  Date({
    required this.start,
    required this.end,
    required this.duration,
  });

  factory Date.fromJson(Map<String, dynamic> json) {
    return Date(
      start: json['start'],
      end: json['end'],
      duration: json['duration'],
    );
  }
}

class Status {
  final dynamic clock;
  final bool halftime;
  final int short;
  final String long;

  Status({
    required this.clock,
    required this.halftime,
    required this.short,
    required this.long,
  });

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      clock: json['clock'],
      halftime: json['halftime'],
      short: json['short'],
      long: json['long'],
    );
  }
}

class Periods {
  final int current;
  final int total;
  final bool endOfPeriod;

  Periods({
    required this.current,
    required this.total,
    required this.endOfPeriod,
  });

  factory Periods.fromJson(Map<String, dynamic> json) {
    return Periods(
      current: json['current'],
      total: json['total'],
      endOfPeriod: json['endOfPeriod'],
    );
  }
}

class Arena {
  final String name;
  final String city;
  final String state;
  final dynamic country;

  Arena({
    required this.name,
    required this.city,
    required this.state,
    required this.country,
  });

  factory Arena.fromJson(Map<String, dynamic> json) {
    return Arena(
      name: json['name'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
    );
  }
}

class Teams {
  final Team visitors;
  final Team home;

  Teams({
    required this.visitors,
    required this.home,
  });

  factory Teams.fromJson(Map<String, dynamic> json) {
    return Teams(
      visitors: Team.fromJson(json['visitors']),
      home: Team.fromJson(json['home']),
    );
  }
}

class Team {
  final int id;
  final String name;
  final String nickname;
  final String code;
  final String logo;

  Team({
    required this.id,
    required this.name,
    required this.nickname,
    required this.code,
    required this.logo,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'],
      name: json['name'],
      nickname: json['nickname'],
      code: json['code'],
      logo: json['logo'],
    );
  }
}

class Scores {
  final Score visitors;
  final Score home;

  Scores({
    required this.visitors,
    required this.home,
  });

  factory Scores.fromJson(Map<String, dynamic> json) {
    return Scores(
      visitors: Score.fromJson(json['visitors']),
      home: Score.fromJson(json['home']),
    );
  }
}

class Score {
  final int win;
  final int loss;
  final Series series;
  final List<String> linescore;
  final int points;

  Score({
    required this.win,
    required this.loss,
    required this.series,
    required this.linescore,
    required this.points,
  });

  factory Score.fromJson(Map<String, dynamic> json) {
    return Score(
      win: json['win'],
      loss: json['loss'],
      series: Series.fromJson(json['series']),
      linescore: List<String>.from(json['linescore'].map((line) => line.toString())),
      points: json['points'],
    );
  }
}

class Series {
  final int win;
  final int loss;

  Series({
    required this.win,
    required this.loss,
  });

  factory Series.fromJson(Map<String, dynamic> json) {
    return Series(
      win: json['win'],
      loss: json['loss'],
    );
  }
}
*/