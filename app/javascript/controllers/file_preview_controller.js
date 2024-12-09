document.addEventListener("turbo:load", function () {
    const fileInput = document.getElementById("file-upload");
    const previewDiv = document.getElementById("file-preview");
  
    if (fileInput) {
      fileInput.addEventListener("change", function (event) {
        const file = event.target.files[0];
  
        // Clear existing preview
        previewDiv.innerHTML = "";
  
        if (file) {
          if (file.type.startsWith("image/")) {
            const img = document.createElement("img");
            img.src = URL.createObjectURL(file);
            img.style.maxWidth = "200px";
            img.style.maxHeight = "200px";
            previewDiv.appendChild(img);
          } else if (file.type === "application/pdf") {
            const pdfText = document.createElement("p");
            pdfText.textContent = `PDF Uploaded: ${file.name}`;
            previewDiv.appendChild(pdfText);
          } else {
            const unsupported = document.createElement("p");
            unsupported.textContent = "File type not supported for preview.";
            previewDiv.appendChild(unsupported);
          }
        }
      });
    }
  });
  