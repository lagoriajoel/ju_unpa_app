const dataSport = [
  {
    "id": 1,
    "nombre": "VOLLEY",
    "categoria": "MASCULINO",
    "image":
        "https://images.unsplash.com/photo-1592656094267-764a45160876?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  },
  {
    "id": 2,
    "nombre": "BASQUET",
    "categoria": "MASCULINO",
    "image":
        "https://images.unsplash.com/photo-1540712260984-d701320a8909?q=80&w=1931&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  },
  {
    "id": 3,
    "nombre": "HANDBALL",
    "categoria": "FEMENINO",
    "image":
        "https://images.unsplash.com/photo-1587384474964-3a06ce1ce699?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  },
  {
    "id": 4,
    "nombre": "VOLLEY",
    "categoria": "FEMENINO",
    "image":
        "https://images.unsplash.com/photo-1592656094267-764a45160876?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  },
  {
    "id": 5,
    "nombre": "HANDBALL",
    "categoria": "MASCULINO",
    "image":
        "https://images.unsplash.com/photo-1587384474964-3a06ce1ce699?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  }
];

const team1Data = [
  {
    "id": 2,
    "nombre": "UARG",
    "sport": {
      "id": 1,
      "nombre": "VOLLEY",
      "categoria": "MASCULINO",
      "image":
          "https://images.unsplash.com/photo-1592656094267-764a45160876?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    "unidadAcademica": {
      "id": 2,
      "nombre": "UNIDAD ACADEMICA RIO GALLEGOS",
      "localidad": "RIO GALLEGOS",
      "siglas": "UARG"
    },
    "matchWon": 2,
    "matchLost": 0,
    "matchTied": 0,
    "goalFor": 6,
    "goalAgainst": 2,
    "goalDifference": 4,
    "point": 6
  },
  {
    "id": 1,
    "nombre": "UACO",
    "sport": {
      "id": 1,
      "nombre": "VOLLEY",
      "categoria": "MASCULINO",
      "image":
          "https://images.unsplash.com/photo-1592656094267-764a45160876?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    "unidadAcademica": {
      "id": 1,
      "nombre": "UNIDAD ACADEMICA CALETA OLIVIA",
      "localidad": "CALETA OLIVIA",
      "siglas": "UACO"
    },
    "matchWon": 0,
    "matchLost": 2,
    "matchTied": 0,
    "goalFor": 2,
    "goalAgainst": 6,
    "goalDifference": -4,
    "point": 0
  }
];

const fechaData = [
  {
    "id": 5,
    "description": "FECHA 1",
    "games": [
      {
        "id": 5,
        "lugar": "Gimnasio Mosconi",
        "horario": "6:30 PM",
        "score_1": 3,
        "score_2": 1,
        "team_1": {
          "id": 2,
          "nombre": "UARG",
          "sport": {
            "id": 1,
            "nombre": "VOLLEY",
            "categoria": "MASCULINO",
            "image":
                "https://images.unsplash.com/photo-1592656094267-764a45160876?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
          },
          "unidadAcademica": {
            "id": 2,
            "nombre": "UNIDAD ACADEMICA RIO GALLEGOS",
            "localidad": "RIO GALLEGOS",
            "siglas": "UARG"
          },
          "matchWon": 2,
          "matchLost": 0,
          "matchTied": 0,
          "goalFor": 6,
          "goalAgainst": 2,
          "goalDifference": 4,
          "point": 6,
          "hibernateLazyInitializer": {}
        },
        "team_2": {
          "id": 1,
          "nombre": "UACO",
          "sport": {
            "id": 1,
            "nombre": "VOLLEY",
            "categoria": "MASCULINO",
            "image":
                "https://images.unsplash.com/photo-1592656094267-764a45160876?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
          },
          "unidadAcademica": {
            "id": 1,
            "nombre": "UNIDAD ACADEMICA CALETA OLIVIA",
            "localidad": "CALETA OLIVIA",
            "siglas": "UACO"
          },
          "matchWon": 0,
          "matchLost": 2,
          "matchTied": 0,
          "goalFor": 2,
          "goalAgainst": 6,
          "goalDifference": -4,
          "point": 0,
          "hibernateLazyInitializer": {}
        },
        "fecha": "16/11/2023"
      }
    ],
    "numRonda": 0
  },
  {
    "id": 6,
    "description": "FECHA 2",
    "games": [
      {
        "id": 6,
        "lugar": "Gimnasio Pancho Cerda",
        "horario": "6:30 PM",
        "score_1": 3,
        "score_2": 1,
        "team_1": {
          "id": 2,
          "nombre": "UARG",
          "sport": {
            "id": 1,
            "nombre": "VOLLEY",
            "categoria": "MASCULINO",
            "image":
                "https://images.unsplash.com/photo-1592656094267-764a45160876?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
          },
          "unidadAcademica": {
            "id": 2,
            "nombre": "UNIDAD ACADEMICA RIO GALLEGOS",
            "localidad": "RIO GALLEGOS",
            "siglas": "UARG"
          },
          "matchWon": 2,
          "matchLost": 0,
          "matchTied": 0,
          "goalFor": 6,
          "goalAgainst": 2,
          "goalDifference": 4,
          "point": 6,
          "hibernateLazyInitializer": {}
        },
        "team_2": {
          "id": 1,
          "nombre": "UACO",
          "sport": {
            "id": 1,
            "nombre": "VOLLEY",
            "categoria": "MASCULINO",
            "image":
                "https://images.unsplash.com/photo-1592656094267-764a45160876?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
          },
          "unidadAcademica": {
            "id": 1,
            "nombre": "UNIDAD ACADEMICA CALETA OLIVIA",
            "localidad": "CALETA OLIVIA",
            "siglas": "UACO"
          },
          "matchWon": 0,
          "matchLost": 2,
          "matchTied": 0,
          "goalFor": 2,
          "goalAgainst": 6,
          "goalDifference": -4,
          "point": 0,
          "hibernateLazyInitializer": {}
        },
        "fecha": "16/11/2023"
      }
    ],
    "numRonda": 0
  }
];
