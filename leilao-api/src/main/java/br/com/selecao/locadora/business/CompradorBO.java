package br.com.selecao.locadora.business;

import br.com.selecao.locadora.entity.Comprador;
import br.com.selecao.locadora.entity.Empresa;
import br.com.selecao.locadora.entity.Leilao;
import br.com.selecao.locadora.entity.Lote;
import br.com.selecao.locadora.repository.CompradorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

@Service
public class CompradorBO {

    @Autowired
    private CompradorRepository compradorRepository;

    public List<Comprador> buscarTodos(){
        try {
            return compradorRepository.findAll();
        } catch (Exception e) {
            System.out.println(Arrays.toString(e.getStackTrace()));
            return null;
        }
    }

    public Comprador buscarPorId(Long id) {
        try {
            return compradorRepository.findOne(id);
        } catch (Exception e) {
            System.out.println(Arrays.toString(e.getStackTrace()));
            return null;
        }
    }

    public Comprador inserirComprador(Comprador comprador) {
        try {
            return compradorRepository.save(comprador);
        } catch (Exception e) {
            System.out.println(Arrays.toString(e.getStackTrace()));
            return null;
        }
    }

    public Comprador alterarCompradorId(Long id, Comprador compradorNovo) {
        try {
            return compradorRepository.save(compradorNovo);
        } catch (Exception e) {
            return null;
        }
    }

    public boolean deletarPorId(Long id) {
        try {
            compradorRepository.delete(id);
            return true;
        } catch (Exception e) {
            System.out.println(Arrays.toString(e.getStackTrace()));
            return false;
        }
    }

}

