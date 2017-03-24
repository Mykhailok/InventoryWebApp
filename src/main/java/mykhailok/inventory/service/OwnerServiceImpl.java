package mykhailok.inventory.service;

import mykhailok.inventory.dao.OwnerDAO;
import mykhailok.inventory.model.Owner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigInteger;
import java.util.List;

@Service
public class OwnerServiceImpl implements OwnerService {

    @Autowired
    private OwnerDAO ownerDAO;

    @Override
    @Transactional
    public void add(Owner owner) {
        ownerDAO.save(owner);
    }

    @Override
    @Transactional
    public void update(Owner owner) {
        ownerDAO.save(owner);
    }

    @Override
    @Transactional
    public void delete(int id) {
        ownerDAO.delete(id);
    }

    @Override
    @Transactional
    public Owner get(int id) {
        return ownerDAO.get(id);
    }

    @Override
    @Transactional
    public List<Owner> getAll() {
        return ownerDAO.getAll();
    }

    @Override
    public BigInteger countRow() {
        return ownerDAO.countRow();
    }

    @Override
    public Owner findByOwnerLastName(String ownerLastName) {
        return ownerDAO.findByOwnerLastName(ownerLastName);
    }
}
