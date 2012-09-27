
 class Deal
    
    attr_reader :cards, :suits, :players, :hands, :no_of_deals, :hcp, :distribution_points, :total_points, :max_hand_generate
    attr_writer :cards, :suits, :players, :hands, :no_of_deals, :hcp, :distribution_points, :total_points, :max_hand_generate
    def initialize(dealer)
      @cards = {0 => "2", 1 => "3", 2 => "4", 3 => "5", 4 => "6",5 => "7",6 => "8",7 => "9",8 => "T",9 => "J",10 => "Q",11 => "K",12 => "A" }
      @suits = {"spade" => 0, "heart" => 1, "diamond" => 2, "club" => 3}
      @players = {"north" => 0, "east" => 1, "south" => 2, "west" => 3}
      @dealt_players = { 0 => "",1 => "",2 => "" ,3 => ""}
      @hands = Array.new(4) { Array.new(4) { Array.new(13) } }
      @no_of_deals = 1
      @hcp = [0,0,0,0]
      @distribution_points = [0,0,0,0]
      @total_points = [0,0,0,0]
      @max_hand_generate = 0
      @dealer = dealer
      for i in @players["north"]..@players["west"]
         for j in @suits["spade"]..@suits["club"]
           for k in 0..12
             @hands[i][j][k] = 0
           end
         end
      end
      player_keys = @players.keys
      for i in 0..2               # dealing according to dealer
        value = (@players[@dealer] + 1 + i) % 4
        @dealt_players[i] = player_keys[value]
      end
      @dealt_players[3] = @dealer
    end

  def [](player, suit, card)
    @hands[player][suit][card]
  end

  def []=(player, suit, card, value)
    @hands[player][suit][card] = value
  end
 
   
  def get_deal_params(no_of_deals,hcp,max_hand_generate,random_bit)
    random_number1 = 0 
    random_number2 = 0
    total_rand = 0
    time = Time.now
    seed = time.to_i
    @no_of_deals = no_of_deals
    @max_hand_generate = max_hand_generate
   
   
   
    random = Random.new(seed)
    if random_bit == 1
     for i in 0..1
       total_rand = random_number1 + random_number2
       if i == 0 
         random_number1 = random.rand(38)
         @hcp[i]= random_number1
         temp_rand = 40 - random_number1
         random_number2 = random.rand(temp_rand + 1)
         @hcp[i+2]=random_number2
       else
         if total_rand < 40
           temp_rand = 40 - total_rand
           random_number1 = random.rand(temp_rand + 1)
           @hcp[i] = random_number1
           total_rand = total_rand + random_number1
           temp_rand = 40 - total_rand
           
           if temp_rand > 0 then @hcp[i+2] = temp_rand
           else @hcp[i+2] = 0
           end
         end
       end
     end
    else
      for j in 0..3
       @hcp[j] = hcp[j]
#      print "Enter HCp value for "
#      print @dealt_players[j]
#      print ": "
#      @hcp[j] = gets.chomp.to_i
      end 
    end
    print "Random seed :"
    puts seed
  end
  
  
  def random_cardcount_hc(player, total_cards)   # a part from step 3,4
    time = Time.now
    seed = time.to_i
    random = Random.new(seed)
    temp_count = 0
    ncards = [0,0,0,0]
    
      card_rank = 4
      for i in 0..3
        temp_count = 0
        result = 0
        if total_cards[i] > 0
          result = @hcp[player] / card_rank     
          if result > total_cards[i] then temp_count = random.rand(total_cards[i] + 1)
          else temp_count = random.rand(result + 1)
          end
          if temp_count > ncards[i]
            ncards[i] = temp_count
            @hcp[player] = @hcp[player] - (card_rank * ncards[i])
            total_cards[i] = total_cards[i] - ncards[i]
            
            while @hcp[player] < 0
              ncards[i] = ncards[i] - 1
              @hcp[player] = @hcp[player] + card_rank
              total_cards[i] = total_cards[i] + 1
            end
          end
        end
        card_rank = card_rank - 1
      end
    return ncards
  end
 
  
  def random_suit_hc(card_count)
    time = Time.now
    seed = time.to_i
    random = Random.new(seed)
    suit_num = Array.new(card_count)
      for i in 0..card_count-1
        suit_num[i] = random.rand(4)
        if i > 0
          for j in 0..i-1
            if suit_num[i] == suit_num[j]
              suit_num[i] = random.rand(4)
              j=0
            end
          end
        end      
      end
      return suit_num
  end
  
  def check_availbility(suit,card)
    suit_count = 0
    for player in 0..3
      if @hands[player][suit][card] == 1
        suit_count = suit_count + 1
      end
     end
     return suit_count
  end
  
  def random_card_lc(required_cards,total_cards)
    time = Time.now
    seed = time.to_i
    random = Random.new(seed)
    card_count = 0
    if required_cards < total_cards
      card_count = random.rand(required_cards + 1)
    else
      card_count = random.rand(total_cards + 1)
    end if total_cards > 0
  
    return card_count
  end
  
  def allocate_remaining_hc(player,total_cards,required_cards)
    ncards = 0
      while @hcp[player] != 0
      card_rank = 4
      for j in 0..3     #check for remaining high cards
         ncards = @hcp[player] / card_rank
         for k in 0..ncards - 1 
          suit = 0
          while suit < 4
            suit_count = check_availbility(suit,12 - j)
            if total_cards[j] > 0 
              while required_cards[player] <= 0
                 for st in 0..3
                   for cd in 0..8
                     if @hands[player][st][cd] == 1
                       @hands[player][st][cd] = 0
                       required_cards[player] = required_cards[player] + 1
                       total_cards[cd + 4] = total_cards[cd + 4] + 1 
                     end 
                   end
                 end
              end
              allocate_card(player,suit,12 - j,required_cards)
              @hcp[player] = @hcp[player] - card_rank
              total_cards[j] = total_cards[j] - 1
              suit = 4
             end if suit_count == 0
            suit = suit + 1
          end
        end if ncards > 0
        card_rank = card_rank - 1
      end
    end
  end
  
  def allocate_remaining_lc(total_cards,required_cards) 
    suit = 0
    for i in 0..3
      for j in 4..12
        counter = 0
        if total_cards[j] > 0
         for k in 0..total_cards[j] - 1
          if required_cards[i] > 0
            suit = 0
            while suit < 4
                suit_count = suit_count = check_availbility(suit,j - 4)
                if suit_count == 0
                  allocate_card(i,suit,j - 4,required_cards)
                  counter = counter + 1
                  suit = 4
                end 
                suit = suit + 1
            end
          end                   
        end  
        total_cards[j] = total_cards[j] - counter
       end
     end
   end
 end
 
  def allocate_card(player,suit,card,required_cards)
      @hands[player][suit][card] = 1
      required_cards[player] = required_cards[player] - 1
  end

  
  def generate_deal()
      time = Time.now
    seed = time.to_i
    random = Random.new(seed)
    total_cards = [4,4,4,4,4,4,4,4,4,4,4,4,4]
    required_cards = [13,13,13,13]
       
      for i in 0..3    #player : east, west, north, south

          ncards = Array.new(4)
          card_rank = 4
          ncards = random_cardcount_hc(i,total_cards)   #allocating high cards
          
          for j in 0..3   #high cards A,K,Q,J random distribution
            suit_num = Array.new(ncards[j] + 1)
            total_cards[j] = total_cards[j] + ncards[j] 
            @hcp[i] = @hcp[i] + (card_rank * ncards[j])
            for k in 0..ncards[j] - 1
              suit_num[k] = random.rand(4)
              flag = check_availbility(suit_num[k],12 - j)
              if flag == 0
                allocate_card(i,suit_num[k],12 - j,required_cards)
                total_cards[j] = total_cards[j] - 1
                @hcp[i] = @hcp[i] - card_rank
                
              else k = k - 1
                
              end if total_cards[j] > 0
            
            end
            card_rank = card_rank - 1
          end
 
        
      for j in 0..8                       #allocating low cards
        card_count_lc = random_card_lc(required_cards[i],total_cards[j+4])
        if card_count_lc != 0
          for k in 0..card_count_lc - 1
            suit = random.rand(4)
            flag = check_availbility(suit,j)
            if flag == 0
              allocate_card(i,suit,j,required_cards)
              total_cards[4 + j] = total_cards[4 + j] - 1
            else k = k - 1 
            end
          end
        end
       end
      end
     
      for i in 0..3
        allocate_remaining_hc(i,total_cards,required_cards) if @hcp[i] > 0
      end
      
      allocate_remaining_lc(total_cards,required_cards) 
  end
  
  def print_deal
       print "Dealer : "
       puts @dealer
       for i in 0..3
         puts @dealt_players[i]
         for j in @suits["spade"]..@suits["club"]
           for k in 0..12
             if @hands[i][j][k] == 1
               print @cards[k]
               print " "
             end
           end
           puts "\n"
         end
         puts "\n"
         puts "\n"
       end
  end
 end
 

#print "Enter Delaer :"
#dealer = gets.chomp
#deal = Deal.new(dealer)
#puts "1.Random Deal"
#puts "2.Define Rules"
#print " Enter choice : "
#random = gets.chomp.to_i
#if random == 1
#  deal.get_deal_params(1 , 25, 1)
#else
#  deal.get_deal_params(1, 25, 0)
#end
#
#deal.generate_deal
#deal.print_deal