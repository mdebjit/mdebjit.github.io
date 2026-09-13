+++
date = '2025-11-15'
draft = false
title = 'Been There, Done That: India Edition'
author = 'Debjit'
categories = ['escape']
tags = ['travel', 'india', 'exploration', 'bucket-list']
+++

## Track Your India Journey {#track-your-india-journey-}

India's 28 states and 8 union territories offer more than a checklist can capture: distinct landscapes, regional cuisines, and places that reward a return visit.

This is a growing record of my travels, with plenty still left to explore.

---

## How This Works {#how-this-works-}

<style>
.journey-guide {
  --route-orange: #e76f2e;
  --route-green: #228b62;
  --route-blue: #2878a5;
  position: relative;
  margin: 2rem 0 2.5rem;
  padding: 2rem 1.75rem 1.35rem;
  overflow: hidden;
  color: #263238;
  background: linear-gradient(145deg, #fffaf2 0%, #f4faf7 52%, #f2f8fb 100%);
  border: 1px solid rgba(39, 73, 82, 0.13);
  border-radius: 8px;
  box-shadow: 0 14px 35px rgba(31, 63, 71, 0.1);
}

.journey-guide::before {
  content: "";
  position: absolute;
  inset: 0 0 auto;
  height: 4px;
  background: linear-gradient(90deg, var(--route-orange) 0 33.33%, var(--route-green) 33.33% 66.66%, var(--route-blue) 66.66%);
}

.journey-route {
  position: relative;
  display: grid;
  grid-template-columns: repeat(3, minmax(0, 1fr));
  gap: 2rem;
}

.journey-route::before {
  content: "";
  position: absolute;
  top: 25px;
  left: calc(16.66% + 25px);
  right: calc(16.66% + 25px);
  border-top: 2px dashed rgba(53, 86, 91, 0.26);
}

.journey-step {
  position: relative;
  min-width: 0;
}

.journey-marker {
  position: relative;
  z-index: 1;
  display: grid;
  width: 50px;
  height: 50px;
  margin: 0 auto 1rem;
  place-items: center;
  color: #fff;
  font-size: 1rem;
  font-weight: 800;
  border: 5px solid rgba(255, 255, 255, 0.92);
  border-radius: 50%;
  box-shadow: 0 5px 14px rgba(31, 63, 71, 0.2);
}

.journey-step:nth-child(1) .journey-marker { background: var(--route-orange); }
.journey-step:nth-child(2) .journey-marker { background: var(--route-green); }
.journey-step:nth-child(3) .journey-marker { background: var(--route-blue); }

.journey-label {
  display: block;
  margin-bottom: 0.35rem;
  color: #6a777a;
  font-size: 0.68rem;
  font-weight: 800;
  letter-spacing: 0;
  text-align: center;
  text-transform: uppercase;
}

.journey-step h4 {
  margin: 0 0 0.55rem;
  color: #263238;
  font-size: 1.02rem;
  text-align: center;
}

.journey-step p {
  margin: 0;
  color: #536467;
  font-size: 0.88rem;
  line-height: 1.65;
  text-align: center;
}

.journey-save-note {
  display: flex;
  gap: 0.8rem;
  align-items: center;
  margin-top: 1.6rem;
  padding-top: 1.1rem;
  color: #435558;
  font-size: 0.86rem;
  border-top: 1px solid rgba(53, 86, 91, 0.15);
}

.journey-save-icon {
  display: grid;
  flex: 0 0 34px;
  width: 34px;
  height: 34px;
  place-items: center;
  color: var(--route-green);
  background: rgba(34, 139, 98, 0.1);
  border-radius: 50%;
}

.journey-save-note strong { color: #263238; }

@media (max-width: 640px) {
  .journey-guide { padding: 1.65rem 1.15rem 1.2rem; }

  .journey-route {
    grid-template-columns: 1fr;
    gap: 1.4rem;
  }

  .journey-route::before {
    top: 25px;
    bottom: 25px;
    left: 24px;
    right: auto;
    border-top: 0;
    border-left: 2px dashed rgba(53, 86, 91, 0.26);
  }

  .journey-step {
    display: grid;
    grid-template-columns: 50px minmax(0, 1fr);
    column-gap: 1rem;
  }

  .journey-marker {
    grid-row: 1 / span 3;
    margin: 0;
  }

  .journey-label,
  .journey-step h4,
  .journey-step p { text-align: left; }
}
</style>

<div class="journey-guide">
  <div class="journey-route">
    <div class="journey-step">
      <span class="journey-marker">01</span>
      <span class="journey-label">Choose</span>
      <h4>Mark the map</h4>
      <p>Select a state or union territory to mark it as visited. Selected places appear in green.</p>
    </div>
    <div class="journey-step">
      <span class="journey-marker">02</span>
      <span class="journey-label">Discover</span>
      <h4>Track your progress</h4>
      <p>Your totals and regional progress reflect the places recorded on your map.</p>
    </div>
    <div class="journey-step">
      <span class="journey-marker">03</span>
      <span class="journey-label">Connect</span>
      <h4>Compare our journeys</h4>
      <p>Compare the places we've visited and the destinations still on both our lists.</p>
    </div>
  </div>
  <div class="journey-save-note">
    <span class="journey-save-icon" aria-hidden="true">✓</span>
    <span><strong>Saved in this browser.</strong> Your selections are stored locally for your next visit.</span>
  </div>
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

## Your Travel Statistics {#your-travel-statistics-}

<dl class="travel-metrics" aria-live="polite">
  <div><dt>States visited</dt><dd id="states-count">0</dd><span>of 28 states</span></div>
  <div><dt>Union territories</dt><dd id="uts-count">0</dd><span>of 8 territories</span></div>
  <div><dt>India explored</dt><dd><span id="total-percent">0</span>%</dd><span>of 36 destinations</span></div>
  <div><dt>Regions reached</dt><dd id="regions-count">0</dd><span>of 7 regions</span></div>
</dl>

### Regional Progress

<div class="travel-statistics travel-region-grid">
  <div class="travel-region">
    <div class="travel-region__label"><span>North India</span><span id="count-north">0 / 8</span></div>
    <div class="travel-region__track" aria-hidden="true"><div id="bar-north"></div></div>
  </div>
  <div class="travel-region">
    <div class="travel-region__label"><span>South India</span><span id="count-south">0 / 5</span></div>
    <div class="travel-region__track" aria-hidden="true"><div id="bar-south"></div></div>
  </div>
  <div class="travel-region">
    <div class="travel-region__label"><span>East India</span><span id="count-east">0 / 5</span></div>
    <div class="travel-region__track" aria-hidden="true"><div id="bar-east"></div></div>
  </div>
  <div class="travel-region">
    <div class="travel-region__label"><span>West India</span><span id="count-west">0 / 3</span></div>
    <div class="travel-region__track" aria-hidden="true"><div id="bar-west"></div></div>
  </div>
  <div class="travel-region">
    <div class="travel-region__label"><span>Central India</span><span id="count-central">0 / 2</span></div>
    <div class="travel-region__track" aria-hidden="true"><div id="bar-central"></div></div>
  </div>
  <div class="travel-region">
    <div class="travel-region__label"><span>North-East India</span><span id="count-northeast">0 / 7</span></div>
    <div class="travel-region__track" aria-hidden="true"><div id="bar-northeast"></div></div>
  </div>
  <div class="travel-region">
    <div class="travel-region__label"><span>Island territories</span><span id="count-islands">0 / 2</span></div>
    <div class="travel-region__track" aria-hidden="true"><div id="bar-islands"></div></div>
  </div>
</div>

---

## My Travel Checklist {#my-travel-checklist-}

### States (28)

#### Northern India
- [X] **Himachal Pradesh** - Shimla, Manali, Dharamshala
- [X] **Punjab** - Golden Temple, Punjabi culture and cuisine
- [ ] **Haryana** - Kurukshetra, Pinjore Gardens
- [X] **Uttarakhand** - Rishikesh, Char Dham, Nainital, Himalayan treks
- [X] **Uttar Pradesh** - Taj Mahal, Varanasi, Lucknow
- [ ] **Rajasthan** - Jaipur, Udaipur, desert forts and palaces

#### Western India
- [ ] **Gujarat** - Rann of Kutch, Gir National Park, Statue of Unity
- [ ] **Maharashtra** - Mumbai, Ajanta and Ellora caves, Lonavala
- [X] **Goa** - Beaches, Portuguese heritage, nightlife

#### Central India
- [ ] **Madhya Pradesh** - Khajuraho, Sanchi Stupa, tiger reserves
- [ ] **Chhattisgarh** - Chitrakote Falls, regional cultural traditions

#### Eastern India
- [X] **West Bengal** - Kolkata, Darjeeling, Sundarbans
- [X] **Bihar** - Bodh Gaya, Nalanda, Patna
- [X] **Jharkhand** - Ranchi, Jamshedpur, waterfalls
- [X] **Odisha** - Konark Sun Temple, Jagannath Temple in Puri, Chilika Lake
- [X] **Sikkim** - Gangtok, Kanchenjunga, monasteries

#### North-Eastern India (Seven Sisters)
- [X] **Arunachal Pradesh** - Tawang Monastery, Bum La Pass, Ziro Valley
- [X] **Assam** - Tea gardens, Kaziranga, Majuli Island
- [X] **Nagaland** - Hornbill Festival, community traditions
- [ ] **Manipur** - Loktak Lake, Imphal
- [ ] **Mizoram** - Blue mountains, Aizawl
- [ ] **Tripura** - Ujjayanta Palace, Neermahal
- [X] **Meghalaya** - Living root bridges, Cherrapunji, Shillong

#### Southern India
- [X] **Karnataka** - Bengaluru, Hampi, Coorg, Mysore Palace
- [X] **Kerala** - Backwaters, Munnar, Varkala
- [X] **Tamil Nadu** - Chennai, Madurai, Ooty, temple architecture, Kanyakumari
- [X] **Andhra Pradesh** - Tirupati, Araku Valley
- [X] **Telangana** - Hyderabad, Charminar, biryani

### Union Territories (8)

- [X] **Delhi** - Red Fort, India Gate, Qutub Minar
- [ ] **Chandigarh** - Urban planning, Rock Garden, Rose Garden
- [X] **Puducherry** - French heritage, White Town, Auroville
- [ ] **Dadra & Nagar Haveli and Daman & Diu** - Portuguese heritage, beaches
- [X] **Andaman & Nicobar Islands** - Beaches, Cellular Jail, marine life
- [ ] **Lakshadweep** - Coral islands, lagoons, water sports
- [ ] **Ladakh** - Pangong Lake, monasteries, high mountain passes
- [ ] **Jammu & Kashmir** - Dal Lake, houseboats, mountain landscapes

---

## Let's Explore Together {#lets-explore-together-}

<div id="mutual-explore-section">
<div class="explore-comparison" id="unexplored-destinations---lets-go-together-">
  <div class="explore-intro">
    <p class="explore-lede">Where should we go next?</p>
    <p class="explore-aside">Somewhere new to both of us, or somewhere one of us knows by heart.</p>
  </div>
  <div class="explore-strip" id="explore-strip" aria-hidden="true"></div>
  <div class="explore-tabs" role="tablist" aria-label="Compare our travels">
    <button type="button" class="explore-tab" id="explore-tab-new" data-group="new" role="tab" aria-selected="true" aria-controls="explore-panel-new">New to us<span id="mutual-unexplored-count">0</span></button>
    <button type="button" class="explore-tab" id="explore-tab-mine" data-group="mine" role="tab" aria-selected="false" aria-controls="explore-panel-mine" tabindex="-1">My stories<span id="author-only-count">0</span></button>
    <button type="button" class="explore-tab" id="explore-tab-yours" data-group="yours" role="tab" aria-selected="false" aria-controls="explore-panel-yours" tabindex="-1">Your stories<span id="visitor-only-count">0</span></button>
    <button type="button" class="explore-tab" id="explore-tab-shared" data-group="shared" role="tab" aria-selected="false" aria-controls="explore-panel-shared" tabindex="-1">Common ground<span id="both-visited-count">0</span></button>
  </div>
  <div id="mutual-unexplored-list" aria-live="polite"></div>
  <noscript><p>The comparison needs JavaScript. My travel checklist is above.</p></noscript>
</div>
</div>

### A Season for the Next Trip {#perfect-times-to-visit-}

<div class="travel-seasons">
  <details name="travel-season" open>
    <summary><span>Oct - Feb</span><span>Winter</span><i class="fas fa-plus" aria-hidden="true"></i></summary>
    <div class="travel-season-note"><p><strong>Rajasthan, Gujarat, Goa, Kerala, Tamil Nadu, Andhra Pradesh, Telangana, Karnataka</strong></p><p>Desert forts, beach days, and southern India without the summer heat. Diwali, Christmas, and Pongal add their own reasons to go.</p></div>
  </details>
  <details name="travel-season">
    <summary><span>Mar - Apr</span><span>Spring</span><i class="fas fa-plus" aria-hidden="true"></i></summary>
    <div class="travel-season-note"><p><strong>Himachal Pradesh, Uttarakhand, Sikkim, Meghalaya, Arunachal Pradesh</strong></p><p>Flowers in the hills and a little breathing room before the summer rush. Higher routes, especially in Ladakh, depend on snow and road openings.</p></div>
  </details>
  <details name="travel-season">
    <summary><span>Jun - Sep</span><span>Monsoon</span><i class="fas fa-plus" aria-hidden="true"></i></summary>
    <div class="travel-season-note"><p><strong>Kerala, Meghalaya, Goa, Maharashtra, Northeast India</strong></p><p>Green hills and full waterfalls. Leave room for the weather; mountain roads and treks need extra care at this time of year.</p></div>
  </details>
  <details name="travel-season">
    <summary><span>Sep - Nov</span><span>Autumn</span><i class="fas fa-plus" aria-hidden="true"></i></summary>
    <div class="travel-season-note"><p><strong>Ladakh, Jammu &amp; Kashmir, Himachal Pradesh, Uttarakhand, North-East India</strong></p><p>Clearer mountain views after the rains, and Durga Puja in Bengal. Keep an eye on high-altitude road conditions as winter gets closer.</p></div>
  </details>
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

  let activeExploreGroup = 'new';
  const exploreTabs = [...document.querySelectorAll('.explore-tab')];

  function selectExploreGroup(group) {
    activeExploreGroup = group;
    exploreTabs.forEach(tab => {
      const selected = tab.dataset.group === group;
      tab.setAttribute('aria-selected', String(selected));
      tab.tabIndex = selected ? 0 : -1;
    });
    document.querySelectorAll('.explore-panel').forEach(panel => {
      panel.hidden = panel.id !== `explore-panel-${group}`;
    });
  }

  exploreTabs.forEach((tab, index) => {
    tab.addEventListener('click', () => selectExploreGroup(tab.dataset.group));
    tab.addEventListener('keydown', event => {
      const nextIndex = { ArrowRight: (index + 1) % exploreTabs.length, ArrowLeft: (index + exploreTabs.length - 1) % exploreTabs.length, Home: 0, End: exploreTabs.length - 1 }[event.key];
      if (nextIndex === undefined) return;
      event.preventDefault();
      selectExploreGroup(exploreTabs[nextIndex].dataset.group);
      exploreTabs[nextIndex].focus();
    });
  });

  function renderExplorePanel(group, places, caption, emptyMessage) {
    return `<section class="explore-panel" id="explore-panel-${group}" role="tabpanel" aria-labelledby="explore-tab-${group}" tabindex="0" ${activeExploreGroup === group ? '' : 'hidden'}>
      <p class="explore-caption">${caption}</p>
      ${places.length ? `<ol class="destination-index">${places.map(place => `<li>${place}</li>`).join('')}</ol>` : `<p class="travel-empty"><i class="fas fa-route" aria-hidden="true"></i><span>${emptyMessage}</span></p>`}
    </section>`;
  }

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
    
    document.getElementById('mutual-unexplored-count').textContent = neitherVisited.length;
    document.getElementById('author-only-count').textContent = authorOnly.length;
    document.getElementById('visitor-only-count').textContent = visitorOnly.length;
    document.getElementById('both-visited-count').textContent = bothVisited.length;
    
    document.getElementById('explore-strip').innerHTML = allDestinations.map(place => {
      const group = authorVisited.has(place) ? (visitorVisited.has(place) ? 'shared' : 'mine') : (visitorVisited.has(place) ? 'yours' : 'new');
      const label = { new: 'Not on either map', mine: 'On my map', yours: 'On your map', shared: 'On both maps' }[group];
      return `<span class="explore-place--${group}" title="${place}: ${label}"></span>`;
    }).join('');

    document.getElementById('mutual-unexplored-list').innerHTML = [
      renderExplorePanel('new', visitorVisited.size ? neitherVisited : [], 'Places still waiting for a first visit from both of us.', visitorVisited.size ? 'Every destination is covered between us. Time to compare notes.' : 'Your map is still a blank page.'),
      renderExplorePanel('mine', authorOnly, 'A few familiar places I can share with you.', 'There are no places on my map that are not already on yours.'),
      renderExplorePanel('yours', visitorOnly, "I'd love to hear your stories from these places.", 'No places are unique to your map yet.'),
      renderExplorePanel('shared', bothVisited, 'Same places, different memories. We should compare notes.', 'No shared stops on our maps yet.')
    ].join('');
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

{{< food-atlas >}}

---

## Did You Know? {#did-you-know-}

{{< india-facts >}}

---
