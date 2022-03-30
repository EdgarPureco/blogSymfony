<?php

namespace App\Repository;
use App\DTO\SearchDto;
use App\Entity\Games;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Knp\Component\Pager\Pagination\PaginationInterface;
use Knp\Component\Pager\PaginatorInterface;

/**
 * @method Games|null find($id, $lockMode = null, $lockVersion = null)
 * @method Games|null findOneBy(array $criteria, array $orderBy = null)
 * @method Games[]    findAll()
 * @method Games[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class GamesRepository extends ServiceEntityRepository
{
    /**
     * @var PaginatorInterface
     */
    private $paginator;

    public function __construct(ManagerRegistry $registry, PaginatorInterface $paginator)
    {
        parent::__construct($registry, Games::class);
        $this->paginator = $paginator;
    }


    /** 
    * @return PaginationInterface
    */
    public function findsearch(SearchDto $search): PaginationInterface
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


           
        $query = $query->getQuery();

        return $this->paginator->paginate(
            $query,
            $search->page,
            5
        );
    }

}
