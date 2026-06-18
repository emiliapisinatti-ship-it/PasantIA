// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract PasantiaCertificado {

    struct Pasantia {
        address alumno;
        string empresa;
        string rol;
        uint256 duracionMeses;
        bool confirmadaPorEmpresa;
        bool confirmadaPorFacultad;
        bool certificadoEmitido;
    }

    mapping(uint256 => Pasantia) public pasantias;
    uint256 public contadorPasantias;
    address public facultad;

    event CertificadoEmitido(
        uint256 id,
        address alumno,
        string empresa,
        string rol,
        uint256 duracionMeses
    );

    constructor() {
        facultad = msg.sender;
    }

    function registrarPasantia(
        address _alumno,
        string memory _empresa,
        string memory _rol,
        uint256 _duracionMeses
    ) public {
        require(msg.sender == facultad, "Solo la facultad puede registrar pasantias");
        pasantias[contadorPasantias] = Pasantia(
            _alumno,
            _empresa,
            _rol,
            _duracionMeses,
            false,
            false,
            false
        );
        contadorPasantias++;
    }

    function confirmarPorEmpresa(uint256 _id) public {
        require(_id < contadorPasantias, "La pasantia no existe");
        require(!pasantias[_id].certificadoEmitido, "El certificado ya fue emitido");
        pasantias[_id].confirmadaPorEmpresa = true;
        intentarEmitirCertificado(_id);
    }

    function confirmarPorFacultad(uint256 _id) public {
        require(msg.sender == facultad, "Solo la facultad puede confirmar");
        require(_id < contadorPasantias, "La pasantia no existe");
        require(!pasantias[_id].certificadoEmitido, "El certificado ya fue emitido");
        pasantias[_id].confirmadaPorFacultad = true;
        intentarEmitirCertificado(_id);
    }

    function intentarEmitirCertificado(uint256 _id) internal {
        Pasantia storage p = pasantias[_id];
        if (p.confirmadaPorEmpresa && p.confirmadaPorFacultad && !p.certificadoEmitido) {
            p.certificadoEmitido = true;
            emit CertificadoEmitido(_id, p.alumno, p.empresa, p.rol, p.duracionMeses);
        }
    }

    function verificarCertificado(uint256 _id) public view returns (
        bool valido,
        address alumno,
        string memory empresa,
        string memory rol,
        uint256 duracionMeses
    ) {
        require(_id < contadorPasantias, "La pasantia no existe");
        Pasantia memory p = pasantias[_id];
        return (
            p.certificadoEmitido,
            p.alumno,
            p.empresa,
            p.rol,
            p.duracionMeses
        );
    }
}
