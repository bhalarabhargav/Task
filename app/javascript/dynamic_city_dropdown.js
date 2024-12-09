// app/javascript/packs/dynamic_city_dropdown.js
document.addEventListener("turbo:load", function () {
    console.log("Turbo page loaded");
  
    const stateSelect = document.getElementById("state-select");
    const citySelect = document.getElementById("city-select");
  
    if (!stateSelect || !citySelect) {
      console.error("State or City select element not found.");
      return;
    }
  
    stateSelect.addEventListener("change", async function () {
      const selectedState = stateSelect.value;
      console.log("Selected state:", selectedState);
  
      citySelect.innerHTML = '<option value="">Select a city</option>';
  
      if (selectedState) {
        try {
          const response = await fetch(`/cities?state=${selectedState}`);
          if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);
  
          const data = await response.json();
          console.log("Fetched cities data:", data);
  
          if (data.cities && data.cities.length > 0) {
            data.cities.forEach((city) => {
              const option = document.createElement("option");
              option.value = city;
              option.textContent = city;
              citySelect.appendChild(option);
            });
          } else {
            const noCitiesOption = document.createElement("option");
            noCitiesOption.textContent = "No cities available";
            noCitiesOption.value = "";
            citySelect.appendChild(noCitiesOption);
          }
        } catch (error) {
          console.error("Error fetching cities:", error);
        }
      }
    });
  });
  