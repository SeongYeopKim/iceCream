package kr.ice.cream.util;

import kr.ice.cream.dto.CustomerDTO;
import kr.ice.cream.dto.ItemtasteDTO;

import java.util.*;

public class Utils {
	
	Map<Integer, Integer> m = new HashMap<Integer, Integer>();
	Map<Integer, ItemtasteDTO> m1 = new HashMap<Integer, ItemtasteDTO>();
	List<SortDTO> v4 = new ArrayList<SortDTO>();
	int[] ring;
	int i;
	CustomerDTO me;
	List<ItemtasteDTO> your;
	
	public Utils(CustomerDTO me, List<ItemtasteDTO> your){
		this.me = me;
		this.your = your;
	}
	
//	public List<Integer> values(){
//		QuickSort quck = new QuickSort();
//		quck.quickSort(ring, 0, ring.length-1);
//		List<Integer> l = new ArrayList<Integer>();
//		
//		for(int i=0; i<ring.length; i++){
//			l.add(m.get(ring[ring.length-i-1])); // value에 들어있던 item들의 srl값들을 입력
//		}
//		return l; // 리턴 값은 필터링된 값이 높은 순서대로 Srl들의 리스트 이다.
//		
//	}

	private int filtering(CustomerDTO me, ItemtasteDTO you) {
		int a = 10 - Math.abs(me.getSoft() - you.getSoft());
		int b = 10 - Math.abs(me.getSour() - you.getSour());
		int c = 10 - Math.abs(me.getSweet() - you.getSweet());
		return (a + b + c );
	}

//	// customer의 성향과 item들으 성향을 필터링한다
//	void inputMap(CustomerTendency me, List<Item> your) {
//		ring = new int[your.size()];
//
//		for (Item you : your) {
//			int f = filtering(me, you);
//			m.put(f, you.getSrl());
//			ring[i] = f;
//			i++;
//		}
//	}
	
	public List<Integer> inputMapV2() {
		for(ItemtasteDTO you : your) {
			int f = filtering(me, you);
			m.put(f, you.getSrl());
		}
		TreeMap<Integer, Integer> tm = new TreeMap<Integer, Integer>(m);
		Iterator<Integer> iterator = tm.descendingKeySet().iterator();
		
		List<Integer> l = new ArrayList<Integer>();
		while(iterator.hasNext()) {
			l.add(tm.get(iterator.next()));
		}
		
		return l;
	}

	public List<ItemtasteDTO> inputMapV3(){
		for(ItemtasteDTO you : your){
			int f = filtering(me, you);
			m1.put(f, you);
		}
		TreeMap<Integer, ItemtasteDTO> tm = new TreeMap<Integer, ItemtasteDTO>(m1);
		Iterator<Integer> iterator = tm.descendingKeySet().iterator();

		List<ItemtasteDTO> list = new ArrayList<ItemtasteDTO>();
		while(iterator.hasNext()){
			list.add(tm.get(iterator.next()));
		}
		return list;
	}

	public List<ItemtasteDTO> inputMapV4(){
		for(ItemtasteDTO you : your){
			int f = filtering(me, you);
			SortDTO dto = new SortDTO();
			dto.setSort(f);
			dto.setTaste(you);
			v4.add(dto);
		}

		Collections.sort(v4,new NoDescCompare());
		List<ItemtasteDTO> list = new ArrayList<ItemtasteDTO>();

		for(int i=0; i<v4.size(); i++){
			list.add(v4.get(i).getTaste());
		}

		return list;
	}

	class NoDescCompare implements Comparator<SortDTO>{

		@Override
		public int compare(SortDTO o1, SortDTO o2) {
			return o1.getSort() > o2.getSort() ? -1 : o1.getSort() < o2.getSort() ? 1 : 0;
		}
	}

}
