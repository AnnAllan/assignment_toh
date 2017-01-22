require 'pry'
def init
  puts "How many disks between 3 and 10 would you like to use?"
  num_disks = gets.chomp.to_i
  disks = Array.new
  (0..(num_disks - 1)).each do |rod|
    disks[rod] = 0
  end
  #render_board(disks)
  winner = false
  play(disks, winner)
end

def play(disks, winner)
    disk_count = disks.length
    puts "From which rod would you like to remove a disk?"
    rod_from = (gets.chomp.to_i)
    puts "On which rod would you like to place your disk?"
    rod_to = (gets.chomp.to_i)
    from_disk = -1
    to_disk = -1
    (disks.length - 1).downto(0).each do |j|
      if (disks[j] == rod_from - 1 )
        from_disk = j
      end
      if (disks[j] == rod_to -1 )
        to_disk = j
      end
    end
      if (from_disk == -1) || ( (to_disk != -1) && (from_disk > to_disk))
        puts "Illegal Move"
      end
      if (to_disk == -1) || (to_disk > from_disk)
        disks[from_disk] = rod_to - 1
        puts "Disk #{from_disk + 1} on Rod #{rod_from} to Rod #{rod_to} on Disk #{to_disk + 1}"
      end
      render_game(disk_count, disks)
      win(disks, winner)
end

def win(disks, winner)
  (0..(disks.length - 1)).each do |k|
    if (disks[k] != 2)
      winner = false
      break
    end
    winner = true
  end
    if winner == false
      play(disks, winner)
    else
      puts "You Win!"
    end
end

def render_game(disk_count, disks)
  (0..(disk_count -1)).each do |m|
    puts "Disk #{m + 1}: Rod #{disks[m] + 1}"
end
end

init













=begin def display_instructions
    puts "Welcome to Tower of Hanoi"
    puts "Instructions:"
    puts "Follow prompt to enter begining and ending of move.  Enter 'q' to quit"
  end

  def render_disk(index, rod, disks)
    def empty_col(disks)
      disks.length.times do
          print " "
        end
      end

    def current_rod(index, disks)
        (index+1).times do
          print "="
        end
        (disks.length - (index+1)).times do
        print " "
      end
    end

  if (rod == 0)
    current_rod(index, disks)
    empty_col(disks)
    empty_col(disks)
    puts ""
  elsif (rod == 1)
    empty_col(disks)
    current_rod(index, disks)
    empty_col(disks)
    puts ""
  else
    empty_col(disks)
    empty_col(disks)
    current_rod(index, disks)
    puts ""
  end
end


=begin  def render_board(disks)
    puts "Current Board:"
    #count number on each rod
    heights = [0, 0, 0]
    disks.each do |d|
      heights[d] +=1
    end
    puts "#{heights}"
    #figure out where to pring
    disks.length.downto(1) do |row|
      (0..2).each do |rod|
        (0..(disks.length - 1)).each do |index|
          if (row == heights[rod])
            if (rod == disks[index])
              puts "row is #{row}, rod is #{rod} heights is #{heights[rod]} and index is #{index} "
              render_disk(index, rod, disks)
              disks[index] = disks[index] + 1
              break if (row == heights[rod])
            end
            end
          end
        end
      end
    (1..3).each do |peg|
      print "#{peg}"
      (1..disks.length).each do |spaces|
        print " "
      end
    end
    puts ""
  (0..(disks.length - 1)).each do |ind|
      disks[ind] = disks[ind] - 1
    end
    print disks
    play(disks)
  end


  def render_board(disks)
    puts "Current Board:"
    binding.pry
    heights = [0, 0, 0]
    disks.each do |d|
      heights[d] +=1
    end
    (0..(disks.length - 1)).each do |index|
      (0..2).each do |rod|
        disks.length.downto(1) do |row|
          if (row == heights[rod])
            if (rod == disks[index])
              render_disk(index, rod, disks)
              disks[index] = disks[index] + 1
            end
            end
          end
        end
      end
    (1..3).each do |peg|
      print "#{peg}"
      (1..disks.length).each do |spaces|
        print " "
      end
    end
    puts ""
  (0..(disks.length - 1)).each do |ind|
      disks[ind] = disks[ind] - 1
    end
    print disks
    play(disks)
  end




  def init
    puts "How many disks between 3 and 10 would you like to use?"
    num_disks = gets.chomp.to_i
    disks = Array.new
    (0..(num_disks - 1)).each do |rod|
      disks[rod] = 0
    end
    render_board(disks)
  end


  def play(disks)
    puts "From which rod would you like to remove a disk?"
    rod_from = (gets.chomp.to_i) -1
    puts "On which rod would you like to place your disk?"
    rod_to = (gets.chomp.to_i) -1
      i = 0
      until disks[i] == rod_from
        i +=1
      end
      disks[i] = rod_to
    print disks
    if win
      thanks(win)
    else
      render_board(disks)
    end
  end


  def quit

  end

  def win

  end

  def valid_inputs

  end

  def thanks(outcome)
    if win
      puts "You Win! Thanks for playing"
   else
     puts  "Thanks for playing!"
   end
 end

  def game
    display_instructions
    init
    play
    thanks
  end
game
=end
