pragma solidity ^0.4.11;
 
contract EtherHealthClub {
    string public symbol = "EHC";
    string public name = " EtherHealthClub ";
    uint8 public constant decimals = 2;
    uint256 _totalSupply = 300000000;
    address owner = 0x35a887e7327cb08e7a510D71a873b09d5055709D;
    bool setupDone = false;
	
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
 
    mapping(address => uint256) balances;
 
    mapping(address => mapping (address => uint256)) allowed;
 
    function Token(address adr) {
		owner = adr;        
    }
	
	function SetupToken(string tokenName, string tokenSymbol, uint256 tokenSupply)
	{
		if (msg.sender == owner && setupDone == false)
		{
			symbol = tokenSymbol;
			name = tokenName;
			_totalSupply = tokenSupply * 100;
			balances[owner] = _totalSupply;
			setupDone = true;
		}
	}
 
    function totalSupply() constant returns (uint256 totalSupply) {        
		return _totalSupply;
    }
 
    function balanceOf(address _owner) constant returns (uint256 balance) {
        return balances[_owner];
    }
 
    function transfer(address _to, uint256 _amount) returns (bool success) {
        if (balances[msg.sender] >= _amount 
            && _amount > 0
            && balances[_to] + _amount > balances[_to]) {
            balances[msg.sender] -= _amount;
            balances[_to] += _amount;
            Transfer(msg.sender, _to, _amount);
            return true;
        } else {
            return false;
        }
    }
 
    function transferFrom(
        address _from,
        address _to,
        uint256 _amount
    ) returns (bool success) {
        if (balances[_from] >= _amount
            && allowed[_from][msg.sender] >= _amount
            && _amount > 0
            && balances[_to] + _amount > balances[_to]) {
            balances[_from] -= _amount;
            allowed[_from][msg.sender] -= _amount;
            balances[_to] += _amount;
            Transfer(_from, _to, _amount);
            return true;
        } else {
            return false;
        }
    }
 
    function approve(address _spender, uint256 _amount) returns (bool success) {
        allowed[msg.sender][_spender] = _amount;
        Approval(msg.sender, _spender, _amount);
        return true;
    }
 
    function allowance(address _owner, address _spender) constant returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }
}