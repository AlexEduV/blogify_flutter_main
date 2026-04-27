import 'package:blogify_flutter_main/domain/data_sources/posts_data_source.dart';
import 'package:collection/collection.dart';

import '../../common/enums/post_category.dart';
import '../../domain/entities/post_entity.dart';

class MockPostsDataSourceImpl implements PostsDataSource {
  @override
  List<PostEntity> allPosts = [];

  @override
  void init() {
    allPosts = [
      const PostEntity(
        id: 1,
        title: 'Where Web 3\nis Going to?',
        author: 'Josh Brian',
        daysAgoPublished: 1,
        minToRead: 5,
        imageSrc:
            'https://images.unsplash.com/photo-1665597704311-d7304eaf70ac?q=80&w=600&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        category: PostCategory.tech,
        paragraphs: [
          'The evolution of the internet has been marked by transformative shifts, from the static pages of Web 1.0 to the interactive and social-driven Web 2.0. Now, Web 3.0 promises a decentralized future where users regain control over their data, digital assets, and online identities. Built on blockchain technology, Web 3 introduces concepts like smart contracts, decentralized finance (DeFi), and tokenized economies, fundamentally changing how we interact with online platforms. Instead of relying on centralized corporations, users in a Web 3 ecosystem engage with peer-to-peer networks, reducing dependency on intermediaries and enabling a more transparent digital space.',
          'However, Web 3 is still in its infancy, facing challenges that range from scalability to user adoption. While decentralization is an attractive concept, the current infrastructure struggles with high transaction fees, slow processing times, and complex user experiences. Moreover, regulatory concerns loom over the industry, as governments and institutions grapple with how to integrate blockchain-based systems into existing legal frameworks. Despite these hurdles, innovations like Layer 2 solutions, cross-chain interoperability, and decentralized autonomous organizations (DAOs) are pushing the boundaries of what’s possible, paving the way for a more accessible and efficient decentralized web.',
          'As Web 3 matures, its impact on industries beyond finance is becoming evident. From decentralized social media platforms that prevent censorship to blockchain-powered supply chains ensuring transparency, the potential applications extend far beyond cryptocurrencies. The transition to Web 3 won’t happen overnight, but the movement toward a more user-centric, secure, and transparent internet is well underway. Whether Web 3 fulfills its promise or faces a hybrid evolution alongside traditional systems remains to be seen, but one thing is certain—change is coming, and it’s redefining the future of the internet as we know it.',
        ],
      ),
      const PostEntity(
        id: 2,
        title: 'Good Listeners Urgently Required',
        author: 'Jay Fitzgerald',
        daysAgoPublished: 2,
        imageSrc:
            'https://images.unsplash.com/photo-1642406415849-a410b5d01a94?q=80&w=200&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        minToRead: 15,
        category: PostCategory.trending,
        paragraphs: [
          'In today\'s fast-paced world, effective communication has never been more crucial. However, the importance of listening is often overlooked. While many focus on the art of speaking, the ability to listen attentively and empathetically is just as essential in building strong relationships, both professionally and personally. As society becomes increasingly distracted by technology and busy schedules, the need for good listeners has never been more urgent. It is not just about hearing words; it\'s about understanding and responding in a way that fosters connection and trust.',
          'The role of a listener goes beyond simply absorbing information. A good listener is someone who is fully present, giving their undivided attention to the speaker. They take the time to understand the message being conveyed and reflect on it before responding thoughtfully. In a world where interruptions and distractions are commonplace, being able to truly listen can set you apart from the rest. It allows for deeper connections, more meaningful conversations, and can lead to a greater sense of empathy and understanding between individuals.',
          'As we navigate an increasingly complex and interconnected world, the demand for skilled listeners is growing. Whether in the workplace, at home, or in social settings, good listeners are the ones who help create a sense of calm and clarity. They allow people to feel heard, valued, and respected. In the midst of chaos and noise, they are the steady presence that helps guide conversations toward solutions and mutual understanding. Now, more than ever, we must prioritize the need for active listening and cultivate this vital skill to foster stronger, more supportive communities.',
        ],
      ),
      const PostEntity(
        id: 3,
        title: 'Being a Better Creative Director',
        author: 'Britton Stipetic',
        daysAgoPublished: 6,
        minToRead: 10,
        imageSrc:
            'https://images.unsplash.com/photo-1596025489331-e31b4d8dc556?q=80&w=200&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        category: PostCategory.trending,
        paragraphs: [
          'Being a creative director requires a unique combination of vision, leadership, and communication skills. It’s not just about having a flair for design or coming up with the next big idea; it’s about leading a team toward a common goal and guiding them to success. A great creative director understands how to inspire and motivate their team, balancing creative freedom with the need to meet deadlines and business objectives. By fostering an environment of collaboration and trust, they can unlock the full potential of their team, leading to innovative solutions that exceed expectations.',
          'The key to being a better creative director lies in developing a keen understanding of the project and the brand, as well as the needs of the audience. A strong creative director takes the time to research, analyze, and develop a clear vision that is aligned with the brand’s values and goals. They also know how to adapt to changing circumstances, remaining flexible while staying true to the core creative direction. By being open to feedback and encouraging constructive criticism, they ensure that every idea is explored and refined, ultimately creating a product that resonates deeply with the audience.',
          'In addition to creative skills, a successful creative director is a strategic thinker. They need to balance creative aspirations with practical considerations like budgets, timelines, and client expectations. Effective communication is crucial in this role, both in terms of presenting ideas clearly to clients and stakeholders and in maintaining an open dialogue with the team. By cultivating both their creative and leadership abilities, a creative director can elevate not only their own work but also the work of everyone they collaborate with, making a lasting impact on the projects they oversee.',
        ],
      ),
      const PostEntity(
        id: 4,
        title: 'The Rise of Quantum Computing',
        author: 'Elena Martinez',
        daysAgoPublished: 2,
        minToRead: 6,
        imageSrc:
            'https://images.unsplash.com/photo-1617839625591-e5a789593135?q=80&w=200&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        category: PostCategory.tech,
        paragraphs: [
          'Quantum computing is poised to revolutionize the way we process information, offering computational power far beyond the capabilities of classical computers. By leveraging the principles of quantum mechanics, such as superposition and entanglement, quantum computers can solve complex problems in seconds that would take traditional machines millennia.',
          'Despite its promise, the field faces significant hurdles. Quantum hardware is notoriously difficult to build and maintain, requiring extremely low temperatures and precise control over quantum bits, or qubits. Additionally, developing algorithms that can fully utilize quantum advantages remains a challenge for researchers.',
          'As investment pours into quantum research, breakthroughs are accelerating. Tech giants and startups alike are racing to achieve quantum supremacy, with potential applications in cryptography, drug discovery, and logistics optimization. The quantum era is on the horizon, and its impact will be felt across industries worldwide.',
        ],
      ),
      const PostEntity(
        id: 5,
        title: 'Sustainable Cities: The Future of Urban Living',
        author: 'Priya Singh',
        daysAgoPublished: 3,
        minToRead: 4,
        imageSrc:
            'https://plus.unsplash.com/premium_photo-1681987448179-4a93b7975018?q=80&w=200&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        category: PostCategory.trending,
        paragraphs: [
          'As urban populations swell, the need for sustainable city planning has never been greater. Modern cities are embracing green technologies, renewable energy, and smart infrastructure to reduce their environmental footprint and improve quality of life.',
          'Initiatives like vertical gardens, efficient public transport, and waste-to-energy plants are transforming urban landscapes. These innovations not only address pollution and congestion but also foster healthier, more resilient communities.',
          'The journey toward sustainability is ongoing, requiring collaboration between governments, businesses, and citizens. By prioritizing eco-friendly solutions, cities can become models of innovation and sustainability for generations to come.',
        ],
      ),
      const PostEntity(
        id: 6,
        title: 'Balancing Productivity and Well-being in remote work',
        author: 'Samantha Lee',
        daysAgoPublished: 5,
        minToRead: 3,
        imageSrc:
            'https://images.unsplash.com/photo-1497032628192-86f99bcd76bc?q=80&w=200&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        category: PostCategory.trending,
        paragraphs: [
          'Remote work has become a defining feature of the modern workplace, offering flexibility and autonomy to employees worldwide. With the right tools and strategies, teams can maintain high productivity levels while enjoying a better work-life balance.',
          'However, remote work also presents challenges, such as isolation, communication barriers, and difficulty separating work from personal life. Companies are investing in digital collaboration platforms and wellness programs to support their distributed workforce.',
          'As organizations adapt to this new normal, the focus is shifting toward results-driven performance and employee well-being. The future of work is hybrid, blending the best of remote and in-office experiences.',
        ],
      ),
      const PostEntity(
        id: 7,
        title: 'Exploring the Metaverse: Beyond Virtual Reality',
        author: 'Lucas Kim',
        daysAgoPublished: 4,
        minToRead: 5,
        imageSrc:
            'https://images.unsplash.com/photo-1653565685070-660c4cf6c68b?q=80&w=200&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        category: PostCategory.tech,
        paragraphs: [
          'The metaverse is emerging as the next frontier in digital interaction, blending virtual reality, augmented reality, and blockchain technology to create immersive online worlds. Users can socialize, work, and play in environments limited only by imagination.',
          'Major tech companies are investing heavily in metaverse platforms, developing tools for digital commerce, entertainment, and education. Virtual assets and NFTs are becoming integral to these ecosystems, enabling new forms of ownership and creativity.',
          'While the metaverse holds immense potential, it also raises questions about privacy, security, and digital identity. As the technology matures, it will redefine how we connect, collaborate, and experience the digital universe.',
        ],
      ),
      const PostEntity(
        id: 8,
        title: 'AI in Healthcare: Revolutionizing Patient Care',
        author: 'Dr. Michael Chen',
        daysAgoPublished: 1,
        minToRead: 5,
        imageSrc:
            'https://plus.unsplash.com/premium_photo-1698755473432-4a8e954685e0?q=80&w=200&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        category: PostCategory.trending,
        paragraphs: [
          'Artificial intelligence is rapidly transforming healthcare, from diagnostics to personalized treatment plans. Machine learning algorithms can analyze vast datasets, identifying patterns that help doctors make more accurate diagnoses and predict patient outcomes.',
          'AI-powered tools are streamlining administrative tasks, reducing the burden on healthcare professionals and allowing them to focus more on patient care. Robotics and automation are also enhancing surgical precision and efficiency.',
          'While the benefits are clear, challenges such as data privacy, algorithmic bias, and regulatory approval must be addressed. As AI continues to evolve, its integration into healthcare promises to deliver more accessible, efficient, and effective medical services.',
        ],
      ),
    ];
  }

  @override
  PostEntity getPostById(int id) {
    final entity = allPosts.firstWhereOrNull((post) => post.id == id);
    if (entity == null) {
      return PostEntity.empty();
    }

    return entity;
  }
}
