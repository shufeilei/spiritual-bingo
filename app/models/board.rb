class Board < ApplicationRecord
  SCORE = {
    easy: 5,
    medium: 10,
    hard: 15,
    xhard: 20,
  }

  TEMPLATE = [
    [
      { name: 'blah', level: 'easy', description: 'hey' },
      { name: 'ha', level: 'hard', description: 'hey' },
      { name: 'blah', level: 'medium', description: 'hey' },
      { name: 'ha', level: 'hard', description: 'hey' },
      { name: 'ka', level: 'easy', description: 'hey' }
    ],
    [
      { name: 'ha', level: 'hard', description: 'hey' },
      { name: 'blah', level: 'medium', description: 'hey' },
      { name: 'blah', level: 'easy', description: 'hey' },
      { name: 'blah', level: 'medium', description: 'hey' },
      { name: 'ha', level: 'hard', description: 'hey' },
    ],
    [
      { name: 'blah', level: 'medium', description: 'hey' },
      { name: 'blah', level: 'easy', description: 'hey' },
      { name: 'ha', level: 'xhard', description: 'REALLY HARD' },
      { name: 'blah', level: 'easy', description: 'hey' },
      { name: 'blah', level: 'medium', description: 'hey' },
    ],
    [
      { name: 'ha', level: 'hard', description: 'hey' },
      { name: 'blah', level: 'medium', description: 'hey' },
      { name: 'blah', level: 'easy', description: 'hey' },
      { name: 'blah', level: 'medium', description: 'hey' },
      { name: 'ha', level: 'hard', description: 'hey' },
    ],
    [
      { name: 'blah', level: 'easy', description: 'hey' },
      { name: 'ha', level: 'hard', description: 'hey' },
      { name: 'blah', level: 'medium', description: 'hey' },
      { name: 'ha', level: 'hard', description: 'hey' },
      { name: 'ka', level: 'easy', description: 'hey' }
    ],
  ]

  has_many :cells
  belongs_to :user

  def individual_score

  end

  def team_score
    # sum of all individual scores on the team
  end
end
