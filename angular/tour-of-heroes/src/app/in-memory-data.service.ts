import { Injectable } from '@angular/core';
import { InMemoryDbService } from 'angular-in-memory-web-api'
import { Hero } from './hero'

@Injectable({
  providedIn: 'root'
})

export class InMemoryDataService implements InMemoryDbService {
  createDb() {

    const heroes = [
      { id: 11, name: 'Ada Lovelace'      },
      { id: 12, name: 'Alan Turing'       },
      { id: 13, name: 'Brian Kerninghan'  },  
      { id: 14, name: 'Dennis Ritchie'    },
      { id: 15, name: 'Grace Hopper'      },
      { id: 16, name: 'Ken Thompson'      },
      { id: 17, name: 'Mary Keller'       },
      { id: 18, name: 'Niklaus Wirth'     },
      { id: 19, name: 'Sophie Wilson'     },
      { id: 20, name: 'Charles Babbage'   },
      { id: 21, name: 'Curt Herztark '    },
      { id: 22, name: 'Konrad Zuze'       }, 
      { id: 23, name: 'Joseph Jacquard'   },
    ]

    return {heroes}
  }

  genId(heroes: Hero[]): number {
    return heroes.length > 0 
      ? Math.max(...heroes.map(hero => hero.id)) + 1
      : 11
  }

}

