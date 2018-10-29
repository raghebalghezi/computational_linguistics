/* *           Copyright (c) 2004, Daniel M. Bikel.
 *                         All rights reserved.
 * 
 *                Developed at the University of Pennsylvania
 *                Institute for Research in Cognitive Science
 *                    3401 Walnut Street
 *                    Philadelphia, Pennsylvania 19104
 * 			
 * 
 * For research or educational purposes only.  Do not redistribute.  For
 * complete license details, please read the file LICENSE that accompanied
 * this software.
 * 
 * DISCLAIMER
 * 
 * Daniel M. Bikel makes no representations or warranties about the suitability of
 * the Software, either express or implied, including but not limited to the
 * implied warranties of merchantability, fitness for a particular purpose, or
 * non-infringement. Daniel M. Bikel shall not be liable for any damages suffered
 * by Licensee as a result of using, modifying or distributing the Software or its
 * derivatives.
 * 
 */
    package danbikel.util;

import java.io.*;
import java.util.*;

public class FixedSizeSingletonList
  extends AbstractFixedSizeList implements Serializable {
  protected Object obj;

  public FixedSizeSingletonList(int size) {
    super(size);
  }

  public FixedSizeSingletonList(Collection c) {
    super(c);
  }

  protected void initialize(int size) {
    if (size != 1)
      throw new IllegalArgumentException();
  }

  public int size() { return 1; }

  public Object get(int index) {
    /*
    if (index != 1)
      throw new IndexOutOfBoundsException();
    */
    return obj;
  }

  public Object set(int index, Object obj) {
    /*
    if (index != 1)
      throw new IndexOutOfBoundsException();
    */
    Object old = obj;
    this.obj = obj;
    return old;
  }

  public int hashCode() { return obj == null ? 0 : obj.hashCode(); }

  public boolean shift(Object obj) {
    this.obj = obj;
    return true;
  }
}
