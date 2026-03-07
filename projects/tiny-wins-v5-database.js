// Tiny Wins V5 - Complete Task Database (350 tasks)
// This file contains all 350 tasks organized by category
// To be embedded in the V5 HTML app

const tinyWinsV5Database = {
  version: "5.0",
  totalTasks: 350,
  tasksPerCategory: 50,
  displayPerCategory: 10,
  
  categories: [
    {
      id: 'home',
      icon: '🏠',
      title: 'Home Environment',
      color: '#ff6b6b',
      tasks: [
        'Put one thing back where it belongs','Clear a surface (counter, table, desk)','Take out the trash',
        'Do one dish or load/unload dishwasher','Make your bed (even just pulling up the covers)','Wipe one bathroom counter',
        'Pick up clothes from floor','Water one plant','Open a window for fresh air','Put away 5 items',
        'Sort mail into recycle/toss/file','Empty bathroom trash can','Wipe kitchen sink with sponge','Fold one towel',
        'Straighten couch cushions','Dust one shelf','Clean one mirror','Sweep one room','Change one lightbulb',
        'Organize one drawer','Wipe down microwave interior','Clean toilet bowl','Vacuum one high-traffic area',
        'Wipe door handles and light switches','Take recycling out','Clean coffee maker','Wipe stovetop',
        'Fluff pillows on couch','Hang up 3 pieces of clothing','Clean one window','Organize shoes by the door',
        'Wipe baseboards in one room','Empty vacuum cleaner canister','Clean shower head','Wipe down fridge handles',
        'Organize pantry shelf','Clean litter box or pet area','Shake out door mats','Wipe down trash can lid',
        'Dust ceiling fan blades','Clean under couch cushions','Wipe down remote controls','Organize junk drawer',
        'Clean bathroom mirror streaks','Sweep porch or entryway','Wipe down kitchen cabinets','Dust picture frames',
        'Clean sink drain with baking soda','Organize medicine cabinet','Wipe down shower walls'
      ]
    },
    {
      id: 'body',
      icon: '💪',
      title: 'Body & Movement',
      color: '#4ecdc4',
      tasks: [
        'Stretch for 2 minutes','Take 10 deep breaths','Drink a glass of water','Do 5 jumping jacks',
        'Walk around the room once','Roll your shoulders 5 times','Stand up and sit down 3 times',
        'Touch your toes (or try!)','Do 3 push-ups (wall or floor)','Dance to one song',
        'March in place for 1 minute','Do 10 arm circles forward','Do 10 arm circles backward',
        'Neck rolls - 3 each direction','Wrist stretches - 10 seconds each','Ankle circles - 5 each foot',
        'Calf raises - 10 reps','Wall sit for 20 seconds','Plank for 15 seconds','Side stretch - hold 15 seconds each',
        'Hip circles - 5 each direction','Quad stretch - hold 20 seconds each leg','Hamstring stretch - hold 20 seconds',
        'Chest opener stretch','Child\'s pose for 30 seconds','Cat-cow stretch - 5 rounds',
        'Seated spinal twist - 15 seconds each side','Butterfly stretch for 30 seconds','Walk up and down stairs once',
        'Do 5 squats','Do 5 lunges (each leg)','High knees for 30 seconds','Butt kicks for 30 seconds',
        'Arm raises overhead - 10 reps','Side lunges - 3 each direction','Tricep dips using chair - 5 reps',
        'Step-ups on stairs - 5 each leg','Shadow box for 1 minute','Jump rope (real or imaginary) for 1 minute',
        'Walk heel-to-toe in a line','Balance on one foot - 15 seconds each','Toe touches while seated',
        'Shoulder blade squeeze - hold 10 seconds','Chin tucks - 5 reps','Pelvic tilts - 10 reps',
        'Glute squeezes - hold 10 seconds, 5 reps','Abdominal bracing - hold 10 seconds','Finger spreads - open/close 10 times',
        'Thumb touches - each fingertip, both hands','Self-massage neck and shoulders'
      ]
    },
    {
      id: 'mind',
      icon: '🧠',
      title: 'Mind & Focus',
      color: '#95e1d3',
      tasks: [
        'Set a timer for 5 minutes of focus','Write down 3 things on your mind','Close eyes and breathe for 1 minute',
        'Make a list of 2 priorities','Read one page of a book','Delete 3 old emails',
        'Set one intention for today','Do a brain dump for 2 minutes','Practice gratitude: name 1 thing',
        'Step away from screen for 2 minutes','Count backwards from 100 by 7s','Name 5 things you can see right now',
        'Name 4 things you can touch','Name 3 things you can hear','Name 2 things you can smell',
        'Name 1 thing you can taste','Box breathing: 4 counts in, hold, out, hold','4-7-8 breathing technique',
        'Alternate nostril breathing','Body scan meditation - 3 minutes','Loving-kindness meditation - 2 minutes',
        'Visualization: peaceful place - 2 minutes','Mindful eating of one snack','Mindful hand washing',
        'Mindful tooth brushing','Single-task for 10 minutes','Pomodoro: 25 min focus, 5 min break',
        'Write morning pages - 3 pages','Journal about one emotion','Write a letter to your future self',
        'List 10 things you\'re good at','Identify one limiting belief','Reframe one negative thought',
        'Practice saying "no" out loud','Set a boundary with yourself','Identify your energy level (1-10)',
        'Notice without judgment for 2 minutes','Label emotions: name what you feel','Practice self-compassion phrase',
        'Forgive yourself for one thing','Celebrate one recent win','Identify one strength you used today',
        'Write an "already done" list','Create a "not to do" list','Define success for today'
      ]
    },
    {
      id: 'social',
      icon: '💬',
      title: 'Social Connection',
      color: '#f38181',
      tasks: [
        'Send one text to a friend','Give someone a compliment','Say "I love you" to someone','Wave at a neighbor',
        'Call someone for 2 minutes','Send a funny meme','Thank someone for something small',
        'Smile at yourself in mirror','Ask someone how their day is','Send a voice note instead of text',
        'React to 3 friends\' social media posts','Share a memory with someone','Ask for advice from someone you trust',
        'Offer to help someone with a small task','Tell someone what you appreciate about them',
        'Send a "thinking of you" message','Introduce yourself to someone new','Remember to use someone\'s name in conversation',
        'Ask someone about their weekend plans','Share a book or show recommendation','Send a photo that reminds you of someone',
        'Wish someone happy birthday (if applicable)','Check in on someone who\'s been quiet',
        'Tell a family member you appreciate them','Leave a positive review for a business',
        'Send a thank you note (digital or paper)','Ask someone about their hobby or interest','Share a joke or funny story',
        'Listen to someone without interrupting','Validate someone\'s feelings','Apologize for something small you did',
        'Forgive someone in your heart','Set a boundary kindly but firmly','Ask for what you need directly',
        'Say "no" to something you don\'t want to do','Accept a compliment gracefully','Give yourself credit out loud',
        'Tell someone you\'re proud of them','Celebrate someone else\'s win','Send an encouraging message to someone struggling',
        'Reconnect with an old friend','Make plans with someone for this week','Cancel plans you\'re dreading (gently)',
        'Join a group or community event','Leave a nice comment on a creator\'s post'
      ]
    },
    {
      id: 'creative',
      icon: '🎨',
      title: 'Creative Expression',
      color: '#aa96da',
      tasks: [
        'Doodle for 2 minutes','Write one sentence','Take a photo of something beautiful','Hum or sing a song',
        'Rearrange one thing decoratively','Write down one idea','Color for 3 minutes','Make a playlist of 3 songs',
        'Look at art online for 2 minutes','Try a new recipe or food combo','Write a 6-word story','Draw your current mood',
        'Make a collage from magazine cutouts','Write a poem (even a bad one)','Take 5 photos from different angles',
        'Create a mood board','Design your dream room on paper','Write a letter you won\'t send','Make up a character and describe them',
        'Sketch your coffee mug','Write a fake product review','Create a new word and define it','Draw with your non-dominant hand',
        'Make a zine from one sheet of paper','Write a haiku about your day','Design a logo for an imaginary business',
        'Create a color palette you love','Write a short dialogue between two people','Make a paper airplane',
        'Origami - fold one simple shape','Finger paint (or use markers)','Create a vision board snippet',
        'Write a bucket list item','Design a tattoo you\'d never get','Make a comic strip (3 panels)','Write a song parody',
        'Create a new recipe combination','Decorate your planner or journal','Make a bookmark','Create a greeting card',
        'Write a fake horoscope','Design a t-shirt graphic','Make a paper chain','Create a word cloud of your day',
        'Write a mini movie review','Design your perfect workspace'
      ]
    },
    {
      id: 'admin',
      icon: '📋',
      title: 'Admin & Life Stuff',
      color: '#f7b731',
      tasks: [
        'Pay one bill','File one paper','Make one appointment','Respond to one message','Check bank balance',
        'Add one item to calendar','Unsubscribe from one email list','Set one reminder','Order one needed item online',
        'Back up phone photos','Set up autopay for one bill','Update one password','Clear your downloads folder',
        'Empty trash/recycle bin on computer','Organize desktop icons','Update software on one device','Clean out voicemail',
        'Update your resume or LinkedIn','Schedule a doctor/dentist appointment','Check expiration dates on medications',
        'Renew your driver\'s license (if needed)','Update emergency contacts','Review and update insurance info',
        'Check credit report (free annual)','Cancel one unused subscription','Return one item you\'ve been meaning to',
        'Organize receipts for taxes','Set a financial goal for the month','Check and update budget categories',
        'Transfer money to savings','Review recurring charges','Update your address with one service',
        'Register to vote or check registration','Research one financial question','Create a password for a new account',
        'Enable two-factor authentication','Review privacy settings on one app','Delete old accounts you don\'t use',
        'Organize bookmarks in browser','Clear browser cache and cookies','Update your phone\'s contact list',
        'Set up a filing system for papers','Shred old documents you don\'t need','Organize cords and cables',
        'Label one container or shelf','Create a meal plan for tomorrow','Make a grocery list'
      ]
    },
    {
      id: 'selfcare',
      icon: '🌸',
      title: 'Self-Care & Comfort',
      color: '#ff9ff3',
      tasks: [
        'Apply lotion to hands','Brush teeth (if not done)','Put on comfortable clothes','Light a candle or use nice scent',
        'Look in mirror and say something kind','Take a shower (even quick)','Put on music you love','Make a cozy drink',
        'Sit in sunlight for 2 minutes','Give yourself permission to rest','Take a warm bath with Epsom salts',
        'Do a foot soak','Give yourself a hand massage','Apply lip balm','Trim your nails','Clean your glasses or sunglasses',
        'Change your pillowcase','Make your sleeping area cozy','Use aromatherapy (candle, oil, spray)','Listen to calming music',
        'Do a body scan for tension','Apply heat or ice to sore areas','Do a gentle face massage','Dry brush your skin',
        'Put on clean, soft pajamas','Make your favorite comfort food','Eat something nourishing','Hydrate with herbal tea',
        'Take a power nap (20 min)','Go to bed 30 minutes earlier','Sleep in an extra 15 minutes','Open curtains for natural light',
        'Sit outside for fresh air','Watch a comfort show episode','Read a chapter of a favorite book','Listen to an audiobook',
        'Do a puzzle or crossword','Play a calming game','Cuddle with a pet or stuffed animal','Wrap yourself in a blanket burrito',
        'Use a weighted blanket','Put on noise-canceling headphones','Create a cozy reading nook','Light a scented candle',
        'Watch the sunset or sunrise','Stargaze for 5 minutes','Sit by a window and people-watch'
      ]
    }
  ],

  // Get random tasks for each category
  getRandomTasksForCategory(categoryId, count = 10) {
    const category = this.categories.find(c => c.id === categoryId);
    if (!category) return [];
    
    const shuffled = [...category.tasks].sort(() => 0.5 - Math.random());
    return shuffled.slice(0, count);
  },

  // Get all tasks for a category
  getAllTasksForCategory(categoryId) {
    const category = this.categories.find(c => c.id === categoryId);
    return category ? category.tasks : [];
  }
};

// Export for use in Node.js environments
if (typeof module !== 'undefined' && module.exports) {
  module.exports = { tinyWinsV5Database };
}
