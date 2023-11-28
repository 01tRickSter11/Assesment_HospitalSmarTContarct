// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HospitalDetails {
    
    struct Hospital {
        uint id;
        string name;
        string location;
        uint capacity;
        bool isRegistered;
    }

    
    mapping(uint => Hospital) public hospitals;

    
    event HospitalRegistered(uint id, string name, string location, uint capacity);

    
    function registerHospital(uint _id, string memory _name, string memory _location, uint _capacity) public {
        require(!hospitals[_id].isRegistered, "Hospital with this ID already exists");
        hospitals[_id] = Hospital(_id, _name, _location, _capacity, true);
        emit HospitalRegistered(_id, _name, _location, _capacity);
    }

   
    function updateHospital(uint _id, string memory _name, string memory _location, uint _capacity) public {
        require(hospitals[_id].isRegistered, "Hospital with this ID does not exist");
        hospitals[_id].name = _name;
        hospitals[_id].location = _location;
        hospitals[_id].capacity = _capacity;
    }

    
    function getHospitalDetails(uint _id) public view returns (string memory, string memory, uint) {
        require(hospitals[_id].isRegistered, "Hospital with this ID does not exist");
        return (hospitals[_id].name, hospitals[_id].location, hospitals[_id].capacity);
    }
}
