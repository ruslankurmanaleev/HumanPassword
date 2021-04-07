class HumanizedPassword
  def initialize(params)
    @length = params[:length].to_i
    @pass = []
  end

  def generate
    # We don't need digits for pass with length below 9
    return only_words if @length < 9

    # We need digits for passwords from 9 to 15
    return words_and_digits if @length < 16

    # Insane mode for complex, long passwords
    complex_mix
  end

  private

  # Example: dumowys
  def only_words
    # Fill with syllables
    @pass << syllable(@length / 2)
    # Fill with 0 or 1 vowel
    @pass << vowels(@length % 2)

    @pass.join
  end

  # Example: wonitumavusu002
  def words_and_digits
    # Calculate the number of syllables
    quarters = @length / 2
    # Fill with syllables, but book the space digits
    @pass << syllable(quarters - 1)
    # Fill the left space with digits
    @pass << digits(@length - @pass.join.size)

    @pass.join
  end

  # Example: ravozite79sagitaju46
  def complex_mix
    # Calculate the number of syllables
    quarters = @length / 2
    # Leave some space for digits
    @pass << syllable(quarters - 6)
    # Add 2 to 4 digits
    @pass << digits([2, 3, 4].sample)
    # And fill with more syllables
    @pass << syllable(quarters - 6)
    # Fill the left space with digits if required
    @pass << digits(@length - @pass.join.size) if @length > @pass.join.size

    @pass.join
  end

  # Constructor for syllables
  def syllable(pairs)
    output = []

    pairs.times { output << "#{vowels}#{constonant}" }

    output
  end

  def vowels(size = 1)
    %w[b c d f g h j k l m n p q r s t v w x z].sample(size).join
  end

  def constonant(size = 1)
    %w[a e i o u y].sample(size).join
  end

  def digits(length)
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0].sample(length).join
  end
end
