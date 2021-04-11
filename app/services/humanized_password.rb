class HumanizedPassword
  attr_reader :pass

  def initialize(params)
    @length = params[:length].to_i
    @pass = []
  end

  def generate
    # Calculate number of syllables
    @number_of_pairs = @length / 2

    # We need words and 1 digit for passwords with less then 9 length
    return only_words if @length < 9

    # We need more digits (2-4) for passwords from 9 to 15 length
    return words_and_digits if @length < 16

    # We need 2 pairs of words (6-8 symbols) and 2-5 digits for passwords 17-20 length
    complex_mix
  end

  private

  # Example: dumowys
  def only_words
    # Calculate the number of left symbols after filling the @pass with syllables
    symbols_left = @length % 2
    # Fill with syllables
    fill_with_syllables
    # Fill with 1 vowel if there any symbols_left
    fill_with_digits(symbols: 1) unless symbols_left.zero?

    @pass.join
  end

  # Example: wonitumavusu002
  def words_and_digits
    # Reserve 1 symbol for digit
    @number_of_pairs -= 1
    # Fill with syllables, but book the space digits
    fill_with_syllables
    # Fill the left space with digits
    fill_with_digits(symbols: fetch_symbols_left)

    @pass.join
  end

  # Example: ravozite79sagitaju46
  def complex_mix
    # Set the number of pairs to have less digits and more letters
    reserved_pairs_for_digits = @length < 18 ? 5 : 6
    syllables_pairs = @number_of_pairs - reserved_pairs_for_digits
    # Leave some space for digits
    fill_with_syllables(pairs: syllables_pairs)
    # Add 1 to 2 digits
    fill_with_digits(symbols: 2)
    # And fill with more syllables
    fill_with_syllables(pairs: syllables_pairs)
    # Add additional syllable
    fill_with_syllables(pairs: 1) if @length < 20
    # Fill the left space with digits if required
    fill_with_digits(symbols: fetch_symbols_left) if available_space_for_digits?

    @pass.join
  end

  def fill_with_syllables(pairs: @number_of_pairs)
    @pass << generate_syllable(pairs: pairs)
  end

  def fill_with_digits(symbols: 1)
    @pass << digits(symbols: symbols)
  end

  def fetch_symbols_left
    @length - @pass.join.size
  end

  def available_space_for_digits?
    @length > @pass.join.size
  end

  # Constructor for syllables
  def generate_syllable(pairs: 1)
    output = []

    pairs.times { output << "#{vowels}#{constonant}" }

    output
  end

  def vowels(size: 1)
    %w[b c d f g h j k l m n p q r s t v w x z].sample(size).join
  end

  def constonant(size: 1)
    %w[a e i o u y].sample(size).join
  end

  def digits(symbols:)
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0].sample(symbols).join
  end
end
