use context dcic2024

data BookRecord:
  | book(title :: String, author :: String, pages :: Number)
end

the-dispossessed = book("The Dispossessed", "Ursula K. Le Guin", 387)
to-the-lighthouse = book("To the Lighthouse", "Virginia Woolf", 209)
brave-new-world = book("Brave New World", "Aldous Huxley", 268)

the-dispossessed.pages


fun is-long-book(b :: BookRecord):
  
  if b.pages > 350:
    
    true 
   
  else: false 
    
  end
end


data Podcast:
  | audio(title :: String, creator :: String, duration :: String)
end


JoeRogan = audio("Andres Baez", "Joe Rogan", "23:34")

fun podcast-summary(c :: Podcast):
  
  "this episode is called" + " " + c.title + " " + "from the creator" + " " + c.creator + " " + "and lasted" +  " " + c. duration
  
end


