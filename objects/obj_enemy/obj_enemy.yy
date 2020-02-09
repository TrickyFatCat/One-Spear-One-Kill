{
    "id": "514fe9ec-4de3-4dfa-8125-88263e9cae93",
    "modelName": "GMObject",
    "mvc": "1.0",
    "name": "obj_enemy",
    "eventList": [
        {
            "id": "3a9e8c9d-b317-4a42-a669-ddc8dcc0707f",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 8,
            "m_owner": "514fe9ec-4de3-4dfa-8125-88263e9cae93"
        },
        {
            "id": "b0defa8a-97cd-4822-9e33-8fd29661efe0",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 0,
            "m_owner": "514fe9ec-4de3-4dfa-8125-88263e9cae93"
        },
        {
            "id": "ab302e0b-3faa-492b-b270-7529bb2d731a",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 25,
            "eventtype": 7,
            "m_owner": "514fe9ec-4de3-4dfa-8125-88263e9cae93"
        },
        {
            "id": "d3c8ede1-039f-49d4-b10f-73efbf9186b1",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 1,
            "eventtype": 3,
            "m_owner": "514fe9ec-4de3-4dfa-8125-88263e9cae93"
        },
        {
            "id": "79e68aa6-e58f-4439-9301-4283abf12bc5",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 1,
            "m_owner": "514fe9ec-4de3-4dfa-8125-88263e9cae93"
        },
        {
            "id": "3e444346-ebeb-4157-a6be-398d8ce25c07",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 12,
            "m_owner": "514fe9ec-4de3-4dfa-8125-88263e9cae93"
        },
        {
            "id": "1fe68339-8f67-4103-850b-060ce9084889",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 2,
            "eventtype": 3,
            "m_owner": "514fe9ec-4de3-4dfa-8125-88263e9cae93"
        }
    ],
    "maskSpriteId": "00000000-0000-0000-0000-000000000000",
    "overriddenProperties": [
        {
            "id": "e33fed70-4d0f-4c7d-be4f-da767f5f9a0a",
            "modelName": "GMOverriddenProperty",
            "mvc": "1.0",
            "objectId": "f2fe14e9-0e9f-42b1-9526-b340b06034d8",
            "propertyId": "f90dff91-088b-42b7-ab0a-85e4be2e45b4",
            "value": "snd_player_step"
        },
        {
            "id": "47a14ecc-2c69-4326-b796-d0402852a90b",
            "modelName": "GMOverriddenProperty",
            "mvc": "1.0",
            "objectId": "f2fe14e9-0e9f-42b1-9526-b340b06034d8",
            "propertyId": "7d0bc748-433e-4955-bc10-f28b1f098439",
            "value": "2"
        }
    ],
    "parentObjectId": "f2fe14e9-0e9f-42b1-9526-b340b06034d8",
    "persistent": false,
    "physicsAngularDamping": 0.1,
    "physicsDensity": 0.5,
    "physicsFriction": 0.2,
    "physicsGroup": 0,
    "physicsKinematic": false,
    "physicsLinearDamping": 0.1,
    "physicsObject": false,
    "physicsRestitution": 0.1,
    "physicsSensor": false,
    "physicsShape": 1,
    "physicsShapePoints": null,
    "physicsStartAwake": true,
    "properties": [
        {
            "id": "f791f8d8-12a1-4211-b9c8-93e4bcc2af1e",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "points_add",
            "varType": 0
        },
        {
            "id": "a0850b83-0c61-4ca3-94f8-a5d1711d5d0c",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "dmg_min",
            "varType": 0
        },
        {
            "id": "89efd88e-1941-4de7-afef-eae1fc4d0676",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "dmg_max",
            "varType": 0
        },
        {
            "id": "08bb010b-6035-4383-85dc-29e733411f55",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "rate_of_fire",
            "varType": 0
        },
        {
            "id": "187e8e6c-382e-4f00-8423-7b12cab22ca6",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "0",
            "varName": "shoot_dist",
            "varType": 0
        }
    ],
    "solid": false,
    "spriteId": "00000000-0000-0000-0000-000000000000",
    "visible": true
}