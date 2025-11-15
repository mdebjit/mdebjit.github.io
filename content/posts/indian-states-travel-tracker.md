+++
date = '2025-11-15'
draft = false
title = 'Been There, Done That: India Edition'
author = 'Debjit'
categories = ['escape']
tags = ['travel', 'india', 'exploration', 'bucket-list']
+++

## Track Your India Journey 🇮🇳

India is a land of incredible diversity - 28 states and 8 union territories, each with its own unique culture, cuisine, landscape, and story. 

**Welcome to our interactive travel tracker!** Mark the places you've visited on the map below, compare your journey with mine, and discover destinations we can explore together.

---

## How This Works 🗺️

<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 20px; margin: 30px 0;">

<div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 25px; border-radius: 15px; color: white; box-shadow: 0 4px 15px rgba(0,0,0,0.2);">
<div style="font-size: 32px; margin-bottom: 10px;">1️⃣</div>
<h4 style="margin: 0 0 10px 0; color: white;">Click on the Map</h4>
<p style="margin: 0; font-size: 0.9em; opacity: 0.9;">Tap any state or union territory on the interactive map below to mark it as visited. It will turn green!</p>
</div>

<div style="background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); padding: 25px; border-radius: 15px; color: white; box-shadow: 0 4px 15px rgba(0,0,0,0.2);">
<div style="font-size: 32px; margin-bottom: 10px;">2️⃣</div>
<h4 style="margin: 0 0 10px 0; color: white;">Watch Stats Update</h4>
<p style="margin: 0; font-size: 0.9em; opacity: 0.9;">See your travel statistics update in real-time below the map. Track your progress across India!</p>
</div>

<div style="background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); padding: 25px; border-radius: 15px; color: white; box-shadow: 0 4px 15px rgba(0,0,0,0.2);">
<div style="font-size: 32px; margin-bottom: 10px;">3️⃣</div>
<h4 style="margin: 0 0 10px 0; color: white;">Compare Journeys</h4>
<p style="margin: 0; font-size: 0.9em; opacity: 0.9;">Scroll down to see places we've both visited, where I can guide you, or where you can show me around!</p>
</div>

</div>

<div style="background: #fff3cd; padding: 15px; border-radius: 8px; margin: 20px 0; border-left: 4px solid #ffc107;">
<strong>💡 Your Progress is Saved!</strong> Your selections are stored in your browser, so you can come back anytime to update your travel map.
</div>

---

## Interactive India Map

<iframe src="/india-map-leaflet.html" width="100%" height="650px" frameborder="0" style="border: none; max-width: 100%; border-radius: 10px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);" id="indiaMapFrame"></iframe>

<script>
// Listen for updates from the iframe
window.addEventListener('message', function(event) {
    if (event.data.type === 'indiaMapUpdate') {
        updateStatistics(event.data.stats);
        // Request the visited places list for mutual exploration section
        const iframe = document.getElementById('indiaMapFrame');
        if (iframe && iframe.contentWindow) {
            iframe.contentWindow.postMessage({ type: 'requestVisitedPlaces' }, '*');
        }
    }
});

function updateStatistics(stats) {
    // Update main stats cards
    document.getElementById('states-count').textContent = stats.states;
    document.getElementById('uts-count').textContent = stats.uts;
    document.getElementById('total-percent').textContent = Math.round((stats.total / 36) * 100);
    
    // Count regions with at least one visit
    let regionsVisited = 0;
    for (let region in stats.regions) {
        if (stats.regions[region].visited > 0) regionsVisited++;
    }
    document.getElementById('regions-count').textContent = regionsVisited;
    
    // Update regional progress bars
    updateRegionBar('north', stats.regions.north);
    updateRegionBar('south', stats.regions.south);
    updateRegionBar('east', stats.regions.east);
    updateRegionBar('west', stats.regions.west);
    updateRegionBar('central', stats.regions.central);
    updateRegionBar('northeast', stats.regions.northeast);
    updateRegionBar('islands', stats.regions.islands);
}

function updateRegionBar(regionId, data) {
    const barElement = document.getElementById(`bar-${regionId}`);
    const countElement = document.getElementById(`count-${regionId}`);
    if (barElement && countElement) {
        const percentage = (data.visited / data.total) * 100;
        barElement.style.width = percentage + '%';
        countElement.textContent = `${data.visited} / ${data.total}`;
    }
}

// Request initial update
window.addEventListener('load', function() {
    setTimeout(function() {
        const iframe = document.getElementById('indiaMapFrame');
        if (iframe && iframe.contentWindow) {
            iframe.contentWindow.postMessage({ type: 'requestUpdate' }, '*');
        }
    }, 500);
});
</script>

---

## Your Travel Statistics 📊

<div style="background: linear-gradient(135deg, #e3f2fd 0%, #bbdefb 100%); padding: 15px; border-radius: 8px; margin-bottom: 20px; border-left: 4px solid #2196F3;">
<p style="margin: 0; font-size: 0.95em;">
These statistics update automatically as you mark places on the map above. Track your journey across India's diverse regions!
</p>
</div>

<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 20px; margin: 30px 0;">
  <div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 25px; border-radius: 15px; text-align: center; color: white; box-shadow: 0 4px 15px rgba(0,0,0,0.2);">
    <div style="font-size: 48px; font-weight: bold; margin-bottom: 10px;" id="states-count">0</div>
    <div style="font-size: 14px; opacity: 0.9;">States Visited</div>
    <div style="font-size: 12px; opacity: 0.7; margin-top: 5px;">out of 28</div>
  </div>
  
  <div style="background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); padding: 25px; border-radius: 15px; text-align: center; color: white; box-shadow: 0 4px 15px rgba(0,0,0,0.2);">
    <div style="font-size: 48px; font-weight: bold; margin-bottom: 10px;" id="uts-count">0</div>
    <div style="font-size: 14px; opacity: 0.9;">Union Territories</div>
    <div style="font-size: 12px; opacity: 0.7; margin-top: 5px;">out of 8</div>
  </div>
  
  <div style="background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); padding: 25px; border-radius: 15px; text-align: center; color: white; box-shadow: 0 4px 15px rgba(0,0,0,0.2);">
    <div style="font-size: 48px; font-weight: bold; margin-bottom: 10px;"><span id="total-percent">0</span>%</div>
    <div style="font-size: 14px; opacity: 0.9;">India Explored</div>
    <div style="font-size: 12px; opacity: 0.7; margin-top: 5px;">36 destinations total</div>
  </div>
  
  <div style="background: linear-gradient(135deg, #fa709a 0%, #fee140 100%); padding: 25px; border-radius: 15px; text-align: center; color: white; box-shadow: 0 4px 15px rgba(0,0,0,0.2);">
    <div style="font-size: 48px; font-weight: bold; margin-bottom: 10px;" id="regions-count">0</div>
    <div style="font-size: 14px; opacity: 0.9;">Regions Covered</div>
    <div style="font-size: 12px; opacity: 0.7; margin-top: 5px;">out of 7 regions</div>
  </div>
</div>

### Regional Progress

<div style="margin: 20px 0;">
  <div style="margin-bottom: 20px;">
    <div style="display: flex; justify-content: space-between; margin-bottom: 5px;">
      <span style="font-weight: bold;">🏔️ North India</span>
      <span style="color: #666;" id="count-north">0 / 8</span>
    </div>
    <div style="background: #e0e0e0; height: 25px; border-radius: 12px; overflow: hidden;">
      <div id="bar-north" style="background: linear-gradient(90deg, #667eea 0%, #764ba2 100%); height: 100%; width: 0%; transition: width 0.5s;"></div>
    </div>
  </div>
  
  <div style="margin-bottom: 20px;">
    <div style="display: flex; justify-content: space-between; margin-bottom: 5px;">
      <span style="font-weight: bold;">🌴 South India</span>
      <span style="color: #666;" id="count-south">0 / 5</span>
    </div>
    <div style="background: #e0e0e0; height: 25px; border-radius: 12px; overflow: hidden;">
      <div id="bar-south" style="background: linear-gradient(90deg, #f093fb 0%, #f5576c 100%); height: 100%; width: 0%; transition: width 0.5s;"></div>
    </div>
  </div>
  
  <div style="margin-bottom: 20px;">
    <div style="display: flex; justify-content: space-between; margin-bottom: 5px;">
      <span style="font-weight: bold;">🌊 East India</span>
      <span style="color: #666;" id="count-east">0 / 5</span>
    </div>
    <div style="background: #e0e0e0; height: 25px; border-radius: 12px; overflow: hidden;">
      <div id="bar-east" style="background: linear-gradient(90deg, #4facfe 0%, #00f2fe 100%); height: 100%; width: 0%; transition: width 0.5s;"></div>
    </div>
  </div>
  
  <div style="margin-bottom: 20px;">
    <div style="display: flex; justify-content: space-between; margin-bottom: 5px;">
      <span style="font-weight: bold;">🏜️ West India</span>
      <span style="color: #666;" id="count-west">0 / 3</span>
    </div>
    <div style="background: #e0e0e0; height: 25px; border-radius: 12px; overflow: hidden;">
      <div id="bar-west" style="background: linear-gradient(90deg, #fa709a 0%, #fee140 100%); height: 100%; width: 0%; transition: width 0.5s;"></div>
    </div>
  </div>
  
  <div style="margin-bottom: 20px;">
    <div style="display: flex; justify-content: space-between; margin-bottom: 5px;">
      <span style="font-weight: bold;">🐅 Central India</span>
      <span style="color: #666;" id="count-central">0 / 2</span>
    </div>
    <div style="background: #e0e0e0; height: 25px; border-radius: 12px; overflow: hidden;">
      <div id="bar-central" style="background: linear-gradient(90deg, #30cfd0 0%, #330867 100%); height: 100%; width: 0%; transition: width 0.5s;"></div>
    </div>
  </div>
  
  <div style="margin-bottom: 20px;">
    <div style="display: flex; justify-content: space-between; margin-bottom: 5px;">
      <span style="font-weight: bold;">🌿 North-East India</span>
      <span style="color: #666;" id="count-northeast">0 / 7</span>
    </div>
    <div style="background: #e0e0e0; height: 25px; border-radius: 12px; overflow: hidden;">
      <div id="bar-northeast" style="background: linear-gradient(90deg, #a8edea 0%, #fed6e3 100%); height: 100%; width: 0%; transition: width 0.5s;"></div>
    </div>
  </div>
  
  <div style="margin-bottom: 20px;">
    <div style="display: flex; justify-content: space-between; margin-bottom: 5px;">
      <span style="font-weight: bold;">🏝️ Island Territories</span>
      <span style="color: #666;" id="count-islands">0 / 2</span>
    </div>
    <div style="background: #e0e0e0; height: 25px; border-radius: 12px; overflow: hidden;">
      <div id="bar-islands" style="background: linear-gradient(90deg, #08aeea 0%, #2af598 100%); height: 100%; width: 0%; transition: width 0.5s;"></div>
    </div>
  </div>
</div>

---

## My Travel Checklist ✓

<div style="background: linear-gradient(135deg, #ffeaa7 0%, #fdcb6e 100%); padding: 20px; border-radius: 12px; margin: 20px 0; border-left: 4px solid #fdcb6e; box-shadow: 0 3px 10px rgba(0,0,0,0.1);">
<h4 style="margin-top: 0;">📋 About This Checklist</h4>
<p style="margin: 0;">
This is <strong>my personal travel record</strong> - the places I have visited are marked with <strong style="color: #27ae60;">✓ [X]</strong>. 
The interactive map above is for <strong>you</strong> to track your own travels! Mark your visited places on the map, and we can compare our journeys in the "Let's Explore Together" section below.
</p>
</div>

### States (28)

#### Northern India
- [ ] **Jammu & Kashmir** - Heaven on Earth, Dal Lake, Houseboats
- [ ] **Ladakh** - Land of High Passes, Pangong Lake, Monasteries  
- [ ] **Himachal Pradesh** - Hill stations, Shimla, Manali, Dharamshala
- [X] **Punjab** - Golden Temple, Rich culture, Punjabi cuisine
- [ ] **Haryana** - Kurukshetra, Pinjore Gardens
- [X] **Uttarakhand** - Yoga capital Rishikesh, Char Dham, Nainital, Himalayan Treks
- [X] **Uttar Pradesh** - Taj Mahal, Varanasi, Lucknow
- [ ] **Rajasthan** - Desert state, Forts & Palaces, Jaipur, Udaipur

### Western India
- [ ] **Gujarat** - Rann of Kutch, Gir National Park, Statue of Unity
- [ ] **Maharashtra** - Mumbai, Ajanta-Ellora Caves, Lonavala
- [X] **Goa** - Beaches, Portuguese heritage, Nightlife

### Central India
- [ ] **Madhya Pradesh** - Khajuraho, Sanchi Stupa, Tiger reserves
- [ ] **Chhattisgarh** - Chitrakote Falls, Tribal culture

### Eastern India
- [X] **West Bengal** - Kolkata, Darjeeling, Sundarbans
- [X] **Bihar** - Bodh Gaya, Nalanda, Patna
- [X] **Jharkhand** - Ranchi, Jamshedpur, Waterfalls
- [X] **Odisha** - Konark Sun Temple, Jagannath Puri, Chilika Lake
- [X] **Sikkim** - Gangtok, Kanchenjunga, Monasteries

### North-Eastern India (Seven Sisters)
- [ ] **Arunachal Pradesh** - Tawang Monastery, Ziro Valley
- [ ] **Assam** - Tea gardens, Kaziranga, Majuli Island
- [ ] **Nagaland** - Hornbill Festival, Tribal culture
- [ ] **Manipur** - Loktak Lake, Imphal
- [ ] **Mizoram** - Blue mountains, Aizawl
- [ ] **Tripura** - Ujjayanta Palace, Neermahal
- [X] **Meghalaya** - Living root bridges, Cherrapunji, Shillong

### Southern India
- [X] **Karnataka** - Bangalore, Hampi, Coorg, Mysore Palace
- [X] **Kerala** - God's Own Country, Backwaters, Munnar, Varkala
- [X] **Tamil Nadu** - Chennai, Madurai, Ooty, Temple architecture, Kanyakumari
- [X] **Andhra Pradesh** - Tirupati, Araku Valley
- [X] **Telangana** - Hyderabad, Charminar, Biryani

---

## Union Territories (8)

- [X] **Delhi** - Capital, Red Fort, India Gate, Qutub Minar
- [ ] **Chandigarh** - Planned city, Rock Garden, Rose Garden
- [X] **Puducherry** - French colony, White Town, Auroville
- [ ] **Dadra & Nagar Haveli and Daman & Diu** - Portuguese heritage, Beaches
- [X] **Andaman & Nicobar Islands** - Pristine beaches, Cellular Jail, Marine life
- [ ] **Lakshadweep** - Coral islands, Lagoons, Water sports
- [ ] **Ladakh** (UT since 2019) - Already counted above
- [ ] **Jammu & Kashmir** (UT since 2019) - Already counted above

---

## Let's Explore Together! ✈️

<div id="mutual-explore-section">
<p style="font-size: 1.1em; text-align: center; color: #666; margin-bottom: 30px;">
Now that you've marked your travels, let's see how our journeys compare! Discover destinations for future adventures together.
</p>

<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 20px; margin: 30px 0;">
  <div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 25px; border-radius: 15px; text-align: center; color: white; box-shadow: 0 4px 15px rgba(0,0,0,0.2);">
    <div style="font-size: 48px; font-weight: bold; margin-bottom: 10px;" id="mutual-unexplored-count">0</div>
    <div style="font-size: 14px; opacity: 0.9;">Places Neither of Us Visited</div>
    <div style="font-size: 12px; opacity: 0.7; margin-top: 5px;">Perfect for joint adventures!</div>
  </div>
  
  <div style="background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); padding: 25px; border-radius: 15px; text-align: center; color: white; box-shadow: 0 4px 15px rgba(0,0,0,0.2);">
    <div style="font-size: 48px; font-weight: bold; margin-bottom: 10px;" id="author-only-count">0</div>
    <div style="font-size: 14px; opacity: 0.9;">Places Only I've Been</div>
    <div style="font-size: 12px; opacity: 0.7; margin-top: 5px;">Let me be your guide here!</div>
  </div>
  
  <div style="background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); padding: 25px; border-radius: 15px; text-align: center; color: white; box-shadow: 0 4px 15px rgba(0,0,0,0.2);">
    <div style="font-size: 48px; font-weight: bold; margin-bottom: 10px;" id="visitor-only-count">0</div>
    <div style="font-size: 14px; opacity: 0.9;">Places Only You've Been</div>
    <div style="font-size: 12px; opacity: 0.7; margin-top: 5px;">Show me around your favorites!</div>
  </div>
  
  <div style="background: linear-gradient(135deg, #fa709a 0%, #fee140 100%); padding: 25px; border-radius: 15px; text-align: center; color: white; box-shadow: 0 4px 15px rgba(0,0,0,0.2);">
    <div style="font-size: 48px; font-weight: bold; margin-bottom: 10px;" id="both-visited-count">0</div>
    <div style="font-size: 14px; opacity: 0.9;">Places We've Both Explored</div>
    <div style="font-size: 12px; opacity: 0.7; margin-top: 5px;">Great minds travel alike!</div>
  </div>
</div>

### Unexplored Destinations - Let's Go Together! 🗺️

<div id="mutual-unexplored-list" style="margin: 20px 0;">
<p style="text-align: center; color: #888; font-style: italic;">👆 Mark your visited places on the map to see which destinations we should explore together...</p>
</div>

### Perfect Times to Visit 🌤️

<div style="margin: 30px 0;">
<p style="margin-bottom: 20px; text-align: center; font-size: 1.1em;">Based on weather, festivals, and natural beauty, here are the best times to explore India:</p>

<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 20px;">

<div style="background: linear-gradient(135deg, #ffeaa7 0%, #fdcb6e 100%); padding: 20px; border-radius: 12px; box-shadow: 0 3px 10px rgba(0,0,0,0.1);">
<h4 style="margin-top: 0; color: #2d3436;">☀️ Winter (Oct - Feb)</h4>
<p style="color: #2d3436; margin: 10px 0;"><strong>Best for:</strong> Rajasthan, Gujarat, Goa, Kerala, Tamil Nadu, Andhra Pradesh, Telangana, Karnataka</p>
<p style="color: #2d3436; font-style: italic; margin: 0; font-size: 0.95em;">Perfect weather for deserts, beaches, and southern India. Festival season with Diwali, Christmas, and Pongal!</p>
</div>

<div style="background: linear-gradient(135deg, #a29bfe 0%, #6c5ce7 100%); padding: 20px; border-radius: 12px; box-shadow: 0 3px 10px rgba(0,0,0,0.1);">
<h4 style="margin-top: 0; color: white;">🌸 Spring (Mar - Apr)</h4>
<p style="color: white; margin: 10px 0;"><strong>Best for:</strong> Ladakh (starts opening), Himachal Pradesh, Uttarakhand, Sikkim, Meghalaya, Arunachal Pradesh</p>
<p style="color: white; font-style: italic; margin: 0; font-size: 0.95em;">Blooming flowers in mountains, comfortable temperatures, and fewer crowds before summer rush.</p>
</div>

<div style="background: linear-gradient(135deg, #55efc4 0%, #00b894 100%); padding: 20px; border-radius: 12px; box-shadow: 0 3px 10px rgba(0,0,0,0.1);">
<h4 style="margin-top: 0; color: white;">🌧️ Monsoon (Jun - Sep)</h4>
<p style="color: white; margin: 10px 0;"><strong>Best for:</strong> Kerala (backwaters), Meghalaya, Goa (lush greenery), Maharashtra (waterfalls), Northeast states</p>
<p style="color: white; font-style: italic; margin: 0; font-size: 0.95em;">Lush landscapes, waterfalls at full glory, and romantic monsoon vibes. Best avoided for mountain treks.</p>
</div>

<div style="background: linear-gradient(135deg, #fab1a0 0%, #e17055 100%); padding: 20px; border-radius: 12px; box-shadow: 0 3px 10px rgba(0,0,0,0.1);">
<h4 style="margin-top: 0; color: white;">🍂 Autumn (Sep - Nov)</h4>
<p style="color: white; margin: 10px 0;"><strong>Best for:</strong> Ladakh, Jammu & Kashmir, Himachal Pradesh, Uttarakhand, North-East India</p>
<p style="color: white; font-style: italic; margin: 0; font-size: 0.95em;">Post-monsoon freshness, clear skies for Himalayan views, and Durga Puja celebrations in Bengal!</p>
</div>

</div>
</div>

<div style="background: linear-gradient(135deg, #667eea22 0%, #764ba222 100%); padding: 25px; border-radius: 15px; margin: 30px 0; border-left: 4px solid #667eea;">
<h4 style="margin-top: 0;">💡 Pro Tip: Planning Our Trip</h4>
<p style="margin: 0;">
Check the states we both haven't visited above, pick a season that works, and let's create unforgettable memories together! 
Consider combining nearby destinations - like Rajasthan's desert forts with Gujarat's Rann of Kutch, or explore the entire Northeast circuit in one epic journey.
</p>
</div>

</div>

<script>
// Define author's visited states (based on checkboxes marked as [X])
const authorVisited = new Set([
    'Punjab', 'Uttarakhand', 'Uttar Pradesh', 'Goa', 'West Bengal', 
    'Bihar', 'Jharkhand', 'Odisha', 'Sikkim', 'Meghalaya', 
    'Karnataka', 'Kerala', 'Tamil Nadu', 'Andhra Pradesh', 'Telangana',
    'Delhi', 'Puducherry', 'Andaman & Nicobar Islands'
]);

// All states and UTs
const allDestinations = [
    'Jammu & Kashmir', 'Ladakh', 'Himachal Pradesh', 'Punjab', 'Haryana', 
    'Uttarakhand', 'Uttar Pradesh', 'Rajasthan', 'Gujarat', 'Maharashtra', 
    'Goa', 'Madhya Pradesh', 'Chhattisgarh', 'West Bengal', 'Bihar', 
    'Jharkhand', 'Odisha', 'Sikkim', 'Arunachal Pradesh', 'Assam', 
    'Nagaland', 'Manipur', 'Mizoram', 'Tripura', 'Meghalaya', 
    'Karnataka', 'Kerala', 'Tamil Nadu', 'Andhra Pradesh', 'Telangana',
    'Delhi', 'Chandigarh', 'Puducherry', 'Dadra & Nagar Haveli and Daman & Diu',
    'Andaman & Nicobar Islands', 'Lakshadweep'
];

function updateMutualExploreSection(visitorVisited) {
    const authorOnly = [];
    const visitorOnly = [];
    const bothVisited = [];
    const neitherVisited = [];
    
    allDestinations.forEach(place => {
        const authorHas = authorVisited.has(place);
        const visitorHas = visitorVisited.has(place);
        
        if (authorHas && visitorHas) {
            bothVisited.push(place);
        } else if (authorHas && !visitorHas) {
            authorOnly.push(place);
        } else if (!authorHas && visitorHas) {
            visitorOnly.push(place);
        } else {
            neitherVisited.push(place);
        }
    });
    
    // Update stat cards
    document.getElementById('mutual-unexplored-count').textContent = neitherVisited.length;
    document.getElementById('author-only-count').textContent = authorOnly.length;
    document.getElementById('visitor-only-count').textContent = visitorOnly.length;
    document.getElementById('both-visited-count').textContent = bothVisited.length;
    
    // Update unexplored list
    const listContainer = document.getElementById('mutual-unexplored-list');
    
    // Check if visitor has marked anything
    if (visitorVisited.size === 0) {
        listContainer.innerHTML = '<p style="text-align: center; color: #888; font-style: italic;">👆 Mark your visited places on the map above to see which destinations we should explore together...</p>';
        return;
    }
    
    if (neitherVisited.length === 0) {
        listContainer.innerHTML = '<p style="text-align: center; color: #888;">🎉 Incredible! We\'ve collectively visited every destination in India! Time to revisit favorites or explore hidden gems within these places!</p>';
    } else {
        let html = '<div style="display: grid; grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 15px;">';
        neitherVisited.forEach(place => {
            html += `
                <div style="background: linear-gradient(135deg, #a8edea 0%, #fed6e3 100%); padding: 15px; border-radius: 10px; text-align: center; font-weight: 500; box-shadow: 0 2px 8px rgba(0,0,0,0.1); transition: transform 0.2s;" 
                     onmouseover="this.style.transform='scale(1.05)'" 
                     onmouseout="this.style.transform='scale(1)'">
                    ${place}
                </div>
            `;
        });
        html += '</div>';
        
        html += `<p style="text-align: center; margin-top: 20px; color: #666; font-style: italic;">
            That's <strong>${neitherVisited.length} amazing destination${neitherVisited.length > 1 ? 's' : ''}</strong> waiting for us to explore together! 🎒
        </p>`;
        
        // Add additional sections if applicable
        if (visitorOnly.length > 0) {
            html += `<h4 style="margin-top: 30px; color: #4facfe; border-bottom: 2px solid #4facfe; padding-bottom: 10px;">🗺️ Places You Can Show Me (${visitorOnly.length})</h4>`;
            html += '<div style="display: grid; grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 15px; margin-top: 15px;">';
            visitorOnly.forEach(place => {
                html += `
                    <div style="background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); padding: 15px; border-radius: 10px; text-align: center; font-weight: 500; color: white; box-shadow: 0 2px 8px rgba(0,0,0,0.1); transition: transform 0.2s;" 
                         onmouseover="this.style.transform='scale(1.05)'" 
                         onmouseout="this.style.transform='scale(1)'">
                        ${place}
                    </div>
                `;
            });
            html += '</div>';
            html += `<p style="text-align: center; margin-top: 15px; color: #666; font-style: italic;">I'd love to hear your stories and recommendations from these places!</p>`;
        }
        
        if (authorOnly.length > 0) {
            html += `<h4 style="margin-top: 30px; color: #f093fb; border-bottom: 2px solid #f093fb; padding-bottom: 10px;">🎒 Places I Can Show You (${authorOnly.length})</h4>`;
            html += '<div style="display: grid; grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 15px; margin-top: 15px;">';
            authorOnly.forEach(place => {
                html += `
                    <div style="background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); padding: 15px; border-radius: 10px; text-align: center; font-weight: 500; color: white; box-shadow: 0 2px 8px rgba(0,0,0,0.1); transition: transform 0.2s;" 
                         onmouseover="this.style.transform='scale(1.05)'" 
                         onmouseout="this.style.transform='scale(1)'">
                        ${place}
                    </div>
                `;
            });
            html += '</div>';
            html += `<p style="text-align: center; margin-top: 15px; color: #666; font-style: italic;">Let me be your guide and share the best spots in these destinations!</p>`;
        }
        
        if (bothVisited.length > 0) {
            html += `<h4 style="margin-top: 30px; color: #667eea; border-bottom: 2px solid #667eea; padding-bottom: 10px;">🤝 Places We've Both Explored (${bothVisited.length})</h4>`;
            html += '<div style="display: grid; grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 15px; margin-top: 15px;">';
            bothVisited.forEach(place => {
                html += `
                    <div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 15px; border-radius: 10px; text-align: center; font-weight: 500; color: white; box-shadow: 0 2px 8px rgba(0,0,0,0.1); transition: transform 0.2s;" 
                         onmouseover="this.style.transform='scale(1.05)'" 
                         onmouseout="this.style.transform='scale(1)'">
                        ${place}
                    </div>
                `;
            });
            html += '</div>';
            html += `<p style="text-align: center; margin-top: 15px; color: #666; font-style: italic;">We should compare notes and favorite experiences from these places!</p>`;
        }
        
        listContainer.innerHTML = html;
    }
}

// Listen for updates from the map iframe
window.addEventListener('message', function(event) {
    if (event.data.type === 'indiaMapUpdate') {
        // Request the full visited places list whenever we get an update
        const iframe = document.getElementById('indiaMapFrame');
        if (iframe && iframe.contentWindow) {
            iframe.contentWindow.postMessage({ type: 'requestVisitedPlaces' }, '*');
        }
    }
    
    if (event.data.type === 'visitedPlacesList') {
        const visitorVisited = new Set(event.data.places);
        updateMutualExploreSection(visitorVisited);
    }
});

// Request initial data on page load with multiple attempts
window.addEventListener('load', function() {
    function requestData() {
        const iframe = document.getElementById('indiaMapFrame');
        if (iframe && iframe.contentWindow) {
            iframe.contentWindow.postMessage({ type: 'requestVisitedPlaces' }, '*');
        }
    }
    
    // Try multiple times to ensure iframe is ready
    setTimeout(requestData, 500);
    setTimeout(requestData, 1000);
    setTimeout(requestData, 2000);
    
    // Initialize with empty visitor data
    updateMutualExploreSection(new Set());
});

// Also listen for the statistics update event to trigger refresh
const originalUpdateStats = window.updateStatistics;
if (typeof updateStatistics === 'function') {
    window.updateStatistics = function(stats) {
        originalUpdateStats(stats);
        // Request updated places list
        const iframe = document.getElementById('indiaMapFrame');
        if (iframe && iframe.contentWindow) {
            iframe.contentWindow.postMessage({ type: 'requestVisitedPlaces' }, '*');
        }
    };
}
</script>

---

## Taste of India

Each region of India has its own culinary masterpiece. Here's one iconic dish from every state and union territory:

<style>
@media (prefers-color-scheme: dark) {
    #taste-of-india strong {
        color: #000000;
    }
    #taste-of-india {
        color: #000000;
    }
    #taste-of-india-ut strong {
        color: #000000;
    }
    #taste-of-india-ut {
        color: #000000;
    }
}
</style>

### States

<div id="taste-of-india" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 15px; margin: 20px 0;">

<div style="border-left: 4px solid #ff6b6b; padding: 12px; background: #fff3f3; border-radius: 5px;">
<strong>Andhra Pradesh:</strong> Hyderabadi Biryani – world-famous, aromatic, and richly spiced.
</div>

<div style="border-left: 4px solid #4ecdc4; padding: 12px; background: #f0fffe; border-radius: 5px;">
<strong>Arunachal Pradesh:</strong> Thukpa – hearty noodle soup from the Himalayas.
</div>

<div style="border-left: 4px solid #95e1d3; padding: 12px; background: #f3fffe; border-radius: 5px;">
<strong>Assam:</strong> Assamese Masor Tenga – tangy fish curry reflecting the Brahmaputra flavors.
</div>

<div style="border-left: 4px solid #f38181; padding: 12px; background: #fff5f5; border-radius: 5px;">
<strong>Bihar:</strong> Litti Chokha – roasted wheat balls with spiced mashed vegetables.
</div>

<div style="border-left: 4px solid #aa96da; padding: 12px; background: #f8f6ff; border-radius: 5px;">
<strong>Chhattisgarh:</strong> Chana Samosa – local stuffed snack specialty.
</div>

<div style="border-left: 4px solid #fcbad3; padding: 12px; background: #fffbfd; border-radius: 5px;">
<strong>Goa:</strong> Goan Fish Curry – coconut-based, tangy, and spicy coastal delight.
</div>

<div style="border-left: 4px solid #ffffd2; padding: 12px; background: #ffffed; border-radius: 5px;">
<strong>Gujarat:</strong> Dhokla – soft, fermented gram flour cake, tangy and fluffy.
</div>

<div style="border-left: 4px solid #a8e6cf; padding: 12px; background: #f4fff9; border-radius: 5px;">
<strong>Haryana:</strong> Bajra Khichdi – nutritious pearl millet porridge, rustic and wholesome.
</div>

<div style="border-left: 4px solid #ffd3b6; padding: 12px; background: #fffaf6; border-radius: 5px;">
<strong>Himachal Pradesh:</strong> Dham – traditional festive platter of rice, dal, and vegetables.
</div>

<div style="border-left: 4px solid #ffaaa5; padding: 12px; background: #fff7f6; border-radius: 5px;">
<strong>Jharkhand:</strong> Thekua – deep-fried sweet cookie, popular in festivals.
</div>

<div style="border-left: 4px solid #ff8b94; padding: 12px; background: #fff5f6; border-radius: 5px;">
<strong>Karnataka:</strong> Bisi Bele Bath – spicy, tangy lentil-rice preparation.
</div>

<div style="border-left: 4px solid #c7ceea; padding: 12px; background: #f8f9fe; border-radius: 5px;">
<strong>Kerala:</strong> Kerala Sadya – elaborate vegetarian feast served on banana leaf.
</div>

<div style="border-left: 4px solid #b5ead7; padding: 12px; background: #f6fefb; border-radius: 5px;">
<strong>Madhya Pradesh:</strong> Bhutte Ka Kees – grated corn cooked with spices and milk.
</div>

<div style="border-left: 4px solid #e2f0cb; padding: 12px; background: #fafff5; border-radius: 5px;">
<strong>Maharashtra:</strong> Pav Bhaji – spicy vegetable mash served with buttered bread.
</div>

<div style="border-left: 4px solid #ffdac1; padding: 12px; background: #fffaf5; border-radius: 5px;">
<strong>Manipur:</strong> Eromba – mashed vegetables with fermented fish, pungent and spicy.
</div>

<div style="border-left: 4px solid #ff9a9e; padding: 12px; background: #fff6f7; border-radius: 5px;">
<strong>Meghalaya:</strong> Jadoh – rice and meat dish cooked with local spices.
</div>

<div style="border-left: 4px solid #feca57; padding: 12px; background: #fffcf3; border-radius: 5px;">
<strong>Mizoram:</strong> Bai – steamed vegetables with bamboo shoots and herbs.
</div>

<div style="border-left: 4px solid #ee5a6f; padding: 12px; background: #fff3f5; border-radius: 5px;">
<strong>Nagaland:</strong> Smoked Pork with Bamboo Shoot – signature tribal delicacy.
</div>

<div style="border-left: 4px solid #48dbfb; padding: 12px; background: #f3fcff; border-radius: 5px;">
<strong>Odisha:</strong> Dalma – lentils with vegetables and spices, healthy and hearty.
</div>

<div style="border-left: 4px solid #ff6348; padding: 12px; background: #fff3f2; border-radius: 5px;">
<strong>Punjab:</strong> Makki di Roti & Sarson da Saag – corn flatbread with mustard greens.
</div>

<div style="border-left: 4px solid #ffa502; padding: 12px; background: #fff8f3; border-radius: 5px;">
<strong>Rajasthan:</strong> Dal Baati Churma – baked wheat balls with spiced lentils and sweet.
</div>

<div style="border-left: 4px solid #0abde3; padding: 12px; background: #f2fcff; border-radius: 5px;">
<strong>Sikkim:</strong> Momos – steamed dumplings with meat or vegetables.
</div>

<div style="border-left: 4px solid #00d2d3; padding: 12px; background: #f0feff; border-radius: 5px;">
<strong>Tamil Nadu:</strong> Idli & Sambar – fermented rice cakes with lentil stew.
</div>

<div style="border-left: 4px solid #fd79a8; padding: 12px; background: #fff5f9; border-radius: 5px;">
<strong>Telangana:</strong> Hyderabadi Haleem – slow-cooked wheat and meat delicacy during Ramadan.
</div>

<div style="border-left: 4px solid #a29bfe; padding: 12px; background: #f7f6ff; border-radius: 5px;">
<strong>Tripura:</strong> Mui Borok – traditional bamboo shoot and meat curry.
</div>

<div style="border-left: 4px solid #6c5ce7; padding: 12px; background: #f4f3ff; border-radius: 5px;">
<strong>Uttar Pradesh:</strong> Tunday Kababi – melt-in-mouth minced meat kebabs from Lucknow.
</div>

<div style="border-left: 4px solid #fab1a0; padding: 12px; background: #fff9f7; border-radius: 5px;">
<strong>Uttarakhand:</strong> Kafuli – spinach and fenugreek leaf stew, earthy and wholesome.
</div>

<div style="border-left: 4px solid #ff7675; padding: 12px; background: #fff5f4; border-radius: 5px;">
<strong>West Bengal:</strong> Rosogolla – world-famous spongy sweet made from chhena.
</div>

</div>

### Union Territories

<div id="taste-of-india-ut" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 15px; margin: 20px 0;">

<div style="border-left: 4px solid #55efc4; padding: 12px; background: #f3fffe; border-radius: 5px;">
<strong>Andaman & Nicobar Islands:</strong> Fish Curry with Coconut Milk – local coastal delicacy.
</div>

<div style="border-left: 4px solid #fdcb6e; padding: 12px; background: #fffcf5; border-radius: 5px;">
<strong>Chandigarh:</strong> Chole Bhature – popular street-food dish, widely consumed.
</div>

<div style="border-left: 4px solid #e17055; padding: 12px; background: #fff6f4; border-radius: 5px;">
<strong>Dadra & Nagar Haveli & Daman & Diu:</strong> Feni with Dried Fish Curry – local Goan-Portuguese fusion flavors.
</div>

<div style="border-left: 4px solid #d63031; padding: 12px; background: #fff2f2; border-radius: 5px;">
<strong>Delhi:</strong> Butter Chicken – globally known, originated from Delhi's kitchens.
</div>

<div style="border-left: 4px solid #00b894; padding: 12px; background: #f2fefa; border-radius: 5px;">
<strong>Jammu & Kashmir:</strong> Rogan Josh – aromatic lamb curry with Kashmiri spices.
</div>

<div style="border-left: 4px solid #0984e3; padding: 12px; background: #f2f8ff; border-radius: 5px;">
<strong>Ladakh:</strong> Thukpa – Tibetan-style noodle soup, staple in high altitudes.
</div>

<div style="border-left: 4px solid #74b9ff; padding: 12px; background: #f5f9ff; border-radius: 5px;">
<strong>Lakshadweep:</strong> Tuna Fish Curry – seafood specialty from the islands.
</div>

<div style="border-left: 4px solid #a29bfe; padding: 12px; background: #f7f6ff; border-radius: 5px;">
<strong>Puducherry:</strong> Prawn Curry with Coconut Milk – French-influenced coastal delicacy.
</div>

</div>

---

## Did you know? 🤓

- **Gujarat's** Statue of Unity is the world's tallest statue at 597 feet - taller than Christ the Redeemer & Statue of Liberty combined!
- **Karnataka's** Hampi was once the richest city in the world in the 14th century!
- **Meghalaya** is the wettest place on Earth! Mawsynram receives an average of 467 inches of rain annually.
- **Maharashtra** Mumbai's dabbawalas run a near-perfect delivery system with only one error in 16 million deliveries, a global logistics marvel.
- **Ladakh** is home to the world's highest motorable road - Khardung La at 18,380 feet!
- **West Bengal** The Howrah Bridge is one of the world's largest cantilever bridges built without a single nut or bolt, an engineering rarity.
- **Odisha** The Konark Sun Temple's stone wheel functions as a 13th-century sundial accurate to the minute, one of the most precise ancient clocks in the world.
- **Telangana** has Ramoji Film City, the largest film studio complex in the world.
- **Andaman & Nicobar** has 572 islands but only 37 are inhabited - the rest are pristine wilderness!
- **Bihar** is the birthplace of two world religions - Buddhism & Jainism.
- **Manipur** has the world's only floating national park (Keibul Lamjao).
- **Assam** contains Majuli, the world's largest river island.
- **Rajasthan** has the world's largest solar park - Bhadla Solar Park covering 14,000 acres.
- **Madhya Pradesh** has the largest wild tiger population on Earth.
- **Delhi** Metro is the world's first metro system to run entirely on solar power.
- **Uttar Pradesh** has the maximum number of UNESCO World Heritage Sites in India - a whopping 9!
- **Arunachal Pradesh** hosts Tawang Monastery, the largest monastery outside Tibet.
- **Mizoram** has a village where twins are born at a rate 4 times the world average!
- **Haryana** has produced more Olympic-level wrestlers than over 150 countries, forming one of the densest clusters of elite wrestlers on Earth.
- **Sikkim** is India's first fully organic state - no chemical fertilizers allowed!
- **Nagaland** celebrates the world's only Hornbill Festival - the "Festival of Festivals" showcasing 16 tribes.
- **Kerala** has the only state-run blockchain-powered certificate system in the world. Also the state with highest litearcy rate in India.
- **Himachal Pradesh** has the world's highest cricket stadium in Dharamshala.
- **Chandigarh** is the only city in India that's a union territory AND a capital of TWO states (Punjab & Haryana).
- **Chhattisgarh** has Chitrakote, one of the widest waterfalls in the world.
- **Puducherry** contains one of the best-preserved French colonial towns outside Europe.
- **Lakshadweep** is India's smallest union territory with just 32 sq km - you could walk across it in a day!
- **Jharkhand** has one of the richest mineral deposits regions on Earth.
- **Goa** sits beside the world's oldest tropical mountain range, the Western Ghats.
- **Andhra Pradesh** has one of the world's second-largest natural harbours at Visakhapatnam.

---
