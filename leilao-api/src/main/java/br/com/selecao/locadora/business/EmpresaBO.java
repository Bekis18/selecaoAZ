package br.com.selecao.locadora.business;

import br.com.selecao.locadora.entity.Comprador;
import br.com.selecao.locadora.entity.Empresa;
import br.com.selecao.locadora.entity.Lote;
import br.com.selecao.locadora.repository.EmpresaRepository;
import org.hibernate.validator.internal.constraintvalidators.hv.EmailValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

@Service
public class EmpresaBO {

    @Autowired
    private EmpresaRepository empresaRepository;

    public List<Empresa> buscarTodos(){
        try {
            return empresaRepository.findAll();
        } catch (Exception e) {
            System.out.println(Arrays.toString(e.getStackTrace()));
            return null;
        }
    }

    public Empresa buscarPorId(Long id) {
        try {
            return empresaRepository.findOne(id);
        } catch (Exception e) {
            System.out.println(Arrays.toString(e.getStackTrace()));
            return null;
        }
    }

    public Empresa inserirEmpresa(Empresa empresa) {
        try {
            empresa.setCreatedAt(LocalDateTime.now());
            empresa.setUpdatedAt(LocalDateTime.now());
            return empresaRepository.save(empresa);
        } catch (Exception e) {
            return null;
        }
    }

    public Empresa alterarEmpresaId(Long id, Empresa empresaNova) {
        try {
            Empresa empresaAtual = buscarPorId(id);

            empresaAtual = empresaNova;

            return empresaRepository.save(empresaAtual);
        } catch (Exception e) {
            return null;
        }
    }

    public boolean deletarPorId(Long id) {
        try {
            empresaRepository.delete(id);
            return true;
        } catch (Exception e) {
            System.out.println(Arrays.toString(e.getStackTrace()));
            return false;
        }
    }
}

