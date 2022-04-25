class Motorcycle < ApplicationRecord
  enum manufacturer: { 
    honda: 0,
    yamaha: 1,
    suzuki: 2,
    kawasaki: 3,
  }
  enum displacement: {
    over: 0,
    ozzz: 1,
    sfz: 2,
    fzz: 3,
    tfz: 4,
    otf: 5,
    fz: 6,
  }
end
