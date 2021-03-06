
class Tower
  def play
    winner = false
    set_up
    input = gets.chomp
    valid_num_disks?(input)
    disks = num_disks(input)
    render_board(disks)
    gameloop(winner, disks)
  end


  def set_up
    puts "Welcome to Tower of Hanoi"
    puts "Instructions:"
    puts "Follow prompt to enter begining and ending of move.  Enter 'q' to quit"
    puts "How many disks between 3 and 10 would you like to use?"
  end

  def valid_num_disks?(input)
    if (input == "q") || (!valid_inputs(input, 3, 10))
      puts "Please try again with vaild selections"
      return false
    end
  end

  def num_disks(input)
    int_disks = input.to_i
    disks = Array.new
    (0..(int_disks - 1)).each do |rod|
      disks[rod] = 0
    end
    return disks
  end

  def gameloop(winner, disks)
    while (!winner) do
      disk_count = disks.length
      puts "From which rod would you like to remove a disk?"
      input = gets.chomp
      if (input == "q") || (!valid_inputs(input, 1, 3))
        puts "Please try again with vaild selections"
        winner = true
      else
        rod_from = (input.to_i)
        puts "On which rod would you like to place your disk?"
        input = gets.chomp
        if (input == "q") || (!valid_inputs(input, 1, 3))
          puts "Please try again with vaild selections"
          winner = true
        else
        rod_to = (input.to_i)
        end
      end
      from_disk = -1
      to_disk = -1
      (disks.length - 1).downto(0).each do |j|
        if (disks[j] == (rod_from - 1))
          from_disk = j
        end
        if (disks[j] == (rod_to -1 ))
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
        render_board(disks)
        if win(disks)
          puts "You Win!"
          puts "Thanks for playing!"
          winner = true
        end
    end
  end

  def win(disks)
    (0..(disks.length - 1)).each do |k|
      if (disks[k] != 2)
        return false
      end
    end
    return true
  end

  def render_board(disks)
    puts "Current Board:"
    heights = [0, 0, 0]
    disks.each do |d|
      heights[d] +=1
    end
    (0..(disks.length - 1)).each do |index|
      (0..2).each do |rod|
        disks.length.downto(1) do |row|
          if (rod == disks[index])
            if (row == heights[rod])
              render_disk(index, rod, disks)
              disks[index] = disks[index] + 20
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
      disks[ind] = disks[ind] - 20
    end
  end

  def render_disk(index, rod, disks)
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

  def empty_col(disks)
    (disks.length + 1).times do
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

  def valid_inputs(input, min, max)
    if (input.to_i != 0)
      return (input.to_i >= min) && (input.to_i <= max)
    end
  end
end

t = Tower.new
t.play
