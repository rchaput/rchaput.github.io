---
title: Research activities
type: landing

# Optional header image (relative to `static/img/` folder).
banner:
  caption: ""
  image: "research-2-cropped2.jpg"

sections:
  - block: "research.activities"
    content:
      title: "Research activities"
      items:
        projects:
          - name: ECIÉA
            dates:
              start: 2026
              end: 2027
            leader: true
          - name: ACCELER-AI
            dates:
              start: 2023
              end: 2027
            url: "https://projet.liris.cnrs.fr/acceler-ai/"
          - name: Ethics.AI
            dates:
              start: 2019
              end: 2023
            url: "https://projet.liris.cnrs.fr/ethicsai/"
        students:
          phd:
            - name: Timon Deschamps
              dates:
                start: 2023
                end: ""
              url: "https://liris.cnrs.fr/these/these-timon-deschamps"
              status: "active"
          graduate:
            - name: Edgar Demeude
              date: 2026
              status: "active"
            - name: Valentin Rieu
              date: 2025
              status: "defended"
            - name: Marceau Nahon
              date: 2024
              status: "defended"
            - name: Clément Scheirlinck
              date: 2023
              status: "defended"
            - name: Najib El Khadir
              date: 2022
              status: "defended"
            - name: Benoît Alcazar
              date: 2021
              status: "defended"
            - name: Imran Krimi
              date: 2021
              status: "defended"
            - name: Jérémy Duval
              date: 2020
              status: "defended"
  
  - block: collection
    id: publications
    content:
      title: "Publications"
      filters:
        folders:
          - publication
      sort_by: "Date"
      sort_ascending: false
    design:
      view: compact
      columns: '1'
---
