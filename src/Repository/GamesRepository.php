<?php

namespace App\Repository;
use App\DTO\SearchDto;
use App\Entity\Games;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\OptimisticLockException;
use Doctrine\ORM\ORMException;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Games|null find($id, $lockMode = null, $lockVersion = null)
 * @method Games|null findOneBy(array $criteria, array $orderBy = null)
 * @method Games[]    findAll()
 * @method Games[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class GamesRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Games::class);
    }

    /**
     * @throws ORMException
     * @throws OptimisticLockException
     */
    public function add(Games $entity, bool $flush = true): void
    {
        $this->_em->persist($entity);
        if ($flush) {
            $this->_em->flush();
        }
    }

    /**
     * @throws ORMException
     * @throws OptimisticLockException
     */
    public function remove(Games $entity, bool $flush = true): void
    {
        $this->_em->remove($entity);
        if ($flush) {
            $this->_em->flush();
        }
    }

  
    public function findByPLateforme($value)
    {
        return $this->createQueryBuilder('g')
            ->andWhere('g.plateforme = :val')
            ->setParameter('val', $value)
            ->orderBy('g.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }

    public function findByGenre($value)
    {
        return $this->createQueryBuilder('g')
            ->andWhere('g.genre = :val')

            ->setParameter('val', $value)
            ->orderBy('g.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }

    public function findByTitle($value)
    {
        return $this->createQueryBuilder('g')
            ->andWhere('g.title = :val')
            ->setParameter('val', $value)
            ->orderBy('g.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }

    public function findNewToOld()
    {
        return $this->createQueryBuilder('g')
            ->orderBy('g.year', 'ASC')
            ->getQuery()
            ->getResult()
        ;
    }

    public function findOldtoNew()
    {
        return $this->createQueryBuilder('g')
            ->orderBy('g.year', 'DESC')
            ->getQuery()
            ->getResult()
        ;
    }

    /** 
    * @return Games[]
    */
    public function findsearch(SearchDto $search): array
    {
       $query =  $this
            ->createQueryBuilder('g')
            ->select('g','p','ge')
            ->join('g.plateforme', 'p')
            ->join('g.genre', 'ge');

        if(!empty($search->q)){
            $query = $query
            ->andWhere('g.title LIKE :q')
            ->setParameter('q', "%{$search->q}%");
        }

        if(!empty($search->plateformes)){
            $query = $query
            ->andWhere('p.id in (:plateformes)')
            ->setParameter('plateformes', $search->plateformes);
        }

        if(!empty($search->genres)){
            $query = $query
            ->andWhere('ge.id in (:genres)')
            ->setParameter('genres', $search->genres);
        }


           
        return $query->getQuery()->getResult();
    }

}
